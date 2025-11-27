import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../models/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/floating_ivr.dart';

<<<<<<< HEAD
import 'package:farmaura/l10n/app_localizations.dart';

=======
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key, required this.appState, this.isNewUser = false});
  final AppState appState;
  final bool isNewUser;

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  String loginType = 'phone';
  String phone = '';
  String shcNumber = '';

  @override
  Widget build(BuildContext context) {
    final isValid = loginType == 'phone' ? phone.length == 10 : shcNumber.length >= 8;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 96,
                    height: 96,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(loginType == 'phone' ? LucideIcons.phone : LucideIcons.badge, color: Colors.white, size: 46),
                  ),
                  const SizedBox(height: 12),
<<<<<<< HEAD
                  Text(AppLocalizations.of(context)!.welcomeBack, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 6),
                  Text(
                    loginType == 'phone'
                        ? AppLocalizations.of(context)!.enterPhoneToContinue
                        : AppLocalizations.of(context)!.enterShcNumber,
=======
                  Text('Welcome Back!', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 6),
                  Text(
                    loginType == 'phone'
                        ? 'Enter your phone number to continue'
                        : 'Enter your SHC registration number',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                    style: const TextStyle(color: AppColors.muted),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, 12))],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(18)),
                          child: Row(
                            children: [
                              _ToggleChip(
<<<<<<< HEAD
                                label: AppLocalizations.of(context)!.phone,
=======
                                label: 'Phone',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                                icon: LucideIcons.phone,
                                active: loginType == 'phone',
                                onTap: () => setState(() => loginType = 'phone'),
                              ),
                              _ToggleChip(
<<<<<<< HEAD
                                label: AppLocalizations.of(context)!.shcId,
=======
                                label: 'SHC ID',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                                icon: LucideIcons.badge,
                                active: loginType == 'shc',
                                onTap: () => setState(() => loginType = 'shc'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (loginType == 'phone') ...[
                          Align(
                            alignment: Alignment.centerLeft,
<<<<<<< HEAD
                            child: Text(AppLocalizations.of(context)!.phoneNumber, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14)),
=======
                            child: Text('Phone Number', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14)),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 64,
                                height: 52,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColors.primary, width: 2),
                                ),
                                child: const Text('+91', style: TextStyle(color: AppColors.primaryDark)),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
<<<<<<< HEAD
                                  decoration: InputDecoration(
                                    counterText: '',
                                    hintText: AppLocalizations.of(context)!.enterTenDigit,
=======
                                  decoration: const InputDecoration(
                                    counterText: '',
                                    hintText: 'Enter 10 digit number',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                                  ),
                                  onChanged: (value) => setState(() => phone = value.replaceAll(RegExp(r'[^0-9]'), '')),
                                ),
                              ),
                            ],
                          ),
                        ] else ...[
                          Align(
                            alignment: Alignment.centerLeft,
<<<<<<< HEAD
                            child: Text(AppLocalizations.of(context)!.shcRegistrationNumber, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14)),
=======
                            child: Text('SHC Registration Number', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14)),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            maxLength: 15,
                            textCapitalization: TextCapitalization.characters,
<<<<<<< HEAD
                            decoration: InputDecoration(hintText: AppLocalizations.of(context)!.enterShcNumber, counterText: ''),
=======
                            decoration: const InputDecoration(hintText: 'Enter SHC registration number', counterText: ''),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                            onChanged: (value) => setState(() => shcNumber = value.toUpperCase()),
                          ),
                        ],
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isValid
                                ? () => context.go('/otp', extra: {
                                      'phoneNumber': phone,
                                      'shcNumber': shcNumber,
                                      'isNewUser': widget.isNewUser,
                                    })
                                : null,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              disabledBackgroundColor: Colors.grey.shade300,
                            ),
<<<<<<< HEAD
                            child: Text(loginType == 'phone' ? AppLocalizations.of(context)!.sendOtp : AppLocalizations.of(context)!.submit),
=======
                            child: Text(loginType == 'phone' ? 'Send OTP' : 'Submit'),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'By continuing, you agree to our Terms & Privacy Policy',
                          style: TextStyle(color: AppColors.muted, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const FloatingIVR(),
          ],
        ),
      ),
    );
  }
}

class _ToggleChip extends StatelessWidget {
  const _ToggleChip({required this.label, required this.icon, required this.active, required this.onTap});
  final String label;
  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: active ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: active ? Colors.white : AppColors.muted),
              const SizedBox(width: 6),
              Text(label, style: TextStyle(color: active ? Colors.white : AppColors.muted)),
            ],
          ),
        ),
      ),
    );
  }
}
