import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class PhoneAuthService {
  // Singleton instance
  static final PhoneAuthService instance = PhoneAuthService._internal();
  PhoneAuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _verificationId;

  // Tracks whether this flow started as "Get Started" (signup) or "Login"
  bool _isSignUpFlow = false;

  /// Sends OTP to the provided phone number
  Future<void> sendOtp({
    required String phoneNumber,
    required bool isNewUser,
    required BuildContext context,
    required void Function() onCodeSentNavigateToOtp,
  }) async {
    _isSignUpFlow = isNewUser;

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-resolution (Android only)
          await _signInWithCredential(credential, context);
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification Failed: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          onCodeSentNavigateToOtp();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP Sent Successfully')),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  /// Verifies the OTP entered by the user
  Future<void> verifyOtp({
    required String smsCode,
    required bool isNewUser,
    required BuildContext context,
  }) async {
    _isSignUpFlow = isNewUser;

    if (_verificationId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verification ID is missing. Please resend OTP.')),
      );
      return;
    }

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );
      await _signInWithCredential(credential, context);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP: ${e.message}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  /// Internal method to sign in and handle user redirection
  Future<void> _signInWithCredential(PhoneAuthCredential credential, BuildContext context) async {
    try {
      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        await _handlePostLogin(user, context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Authentication Failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentication Failed: $e')),
      );
    }
  }

  /// Handles logic after successful login (Firestore check & Redirection)
  Future<void> _handlePostLogin(User user, BuildContext context) async {
    try {
      final userRef = _firestore.collection('users').doc(user.uid);
      final snap = await userRef.get();
      
      // Sync with AppState (Optional but good for immediate UI feedback if needed)
      if (context.mounted) {
        final appState = Provider.of<AppState>(context, listen: false);
        appState.updateUserData({'phone': user.phoneNumber ?? ''});
      }

      if (!snap.exists) {
        // Brand new user
        await userRef.set({
          'uid': user.uid,
          'phoneNumber': user.phoneNumber,
          'createdAt': FieldValue.serverTimestamp(),
          'hasCompletedProfile': false,
          'hasCompletedFarm': false,
        });

        if (context.mounted) {
          // For brand new user -> always personal info first
          context.go('/profile-setup');
        }
        return;
      }

      final data = snap.data() ?? {};
      final bool hasProfile = data['hasCompletedProfile'] == true;
      final bool hasFarm = data['hasCompletedFarm'] == true;

      // Sync existing data to AppState
      if (context.mounted) {
         Provider.of<AppState>(context, listen: false).updateUserData(data);
      }

      if (!hasProfile) {
        // Profile not completed yet
        if (context.mounted) {
          context.go('/profile-setup');
        }
        return;
      }

      if (!hasFarm) {
        // Farm not completed yet
        if (context.mounted) {
          context.go('/farm-setup');
        }
        return;
      }

      // Both done -> decide by flow type
      if (_isSignUpFlow) {
        // Even if they just signed up but everything exists, send to dashboard
        if (context.mounted) {
          context.go('/dashboard');
        }
      } else {
        // Normal login
        if (context.mounted) {
          context.go('/dashboard');
        }
      }
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
         // Fallback for offline/unavailable state
         // If we can't check Firestore, we rely on the flow intent
         if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Offline Mode: Profile syncing unavailable')),
            );
            
            if (_isSignUpFlow) {
              context.go('/profile-setup');
            } else {
              context.go('/dashboard');
            }
         }
      } else {
        rethrow;
      }
    }
  }
}
