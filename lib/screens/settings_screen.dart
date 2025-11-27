import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../models/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/language_change_modal.dart';
<<<<<<< HEAD
import 'package:farmaura/l10n/app_localizations.dart';
=======
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.appState});
  final AppState appState;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final location = widget.appState.location;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
<<<<<<< HEAD
              title: AppLocalizations.of(context)!.settings,
              showBack: true,
              showProfile: false,
              appState: widget.appState,
              onBack: () => Navigator.canPop(context) ? context.pop() : context.go('/profile'),
=======
              title: 'Settings',
              showBack: true,
              showProfile: false,
              appState: widget.appState,
              onBack: () => context.go('/profile'),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
<<<<<<< HEAD
                    _topCard(context),
                    const SizedBox(height: 16),
                    _sectionTitle(AppLocalizations.of(context)!.preferences),
                    const SizedBox(height: 8),
                    _toggleTile(
                      icon: LucideIcons.bell,
                      title: AppLocalizations.of(context)!.notifications,
                      subtitle: notificationsEnabled ? AppLocalizations.of(context)!.enabled : AppLocalizations.of(context)!.disabled,
=======
                    _topCard(),
                    const SizedBox(height: 16),
                    _sectionTitle('Preferences'),
                    const SizedBox(height: 8),
                    _toggleTile(
                      icon: LucideIcons.bell,
                      title: 'Notifications',
                      subtitle: notificationsEnabled ? 'Enabled' : 'Disabled',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                      value: notificationsEnabled,
                      onChanged: (val) => setState(() => notificationsEnabled = val),
                    ),
                    _navTile(
                      icon: LucideIcons.languages,
<<<<<<< HEAD
                      title: AppLocalizations.of(context)!.language,
=======
                      title: 'Language',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                      subtitle: widget.appState.userLanguage,
                      onTap: () => showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => LanguageChangeModal(appState: widget.appState),
                      ),
                    ),
                    _navTile(
                      icon: LucideIcons.mapPin,
<<<<<<< HEAD
                      title: AppLocalizations.of(context)!.location,
=======
                      title: 'Location',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                      subtitle: "${location['district']}, ${location['state']}",
                      onTap: () {},
                    ),
                    const SizedBox(height: 14),
<<<<<<< HEAD
                    _sectionTitle(AppLocalizations.of(context)!.privacySecurity),
                    const SizedBox(height: 8),
                    _navTile(
                      icon: LucideIcons.shield,
                      title: AppLocalizations.of(context)!.privacyPolicy,
                      subtitle: AppLocalizations.of(context)!.privacyPolicySubtitle,
=======
                    _sectionTitle('Privacy & Security'),
                    const SizedBox(height: 8),
                    _navTile(
                      icon: LucideIcons.shield,
                      title: 'Privacy Policy',
                      subtitle: 'Read how we handle data',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                      onTap: () => context.go('/privacy-policy'),
                    ),
                    _navTile(
                      icon: LucideIcons.fileText,
<<<<<<< HEAD
                      title: AppLocalizations.of(context)!.termsOfService,
                      subtitle: AppLocalizations.of(context)!.termsOfServiceSubtitle,
                      onTap: () => context.go('/terms-conditions'),
                    ),
                    const SizedBox(height: 14),
                    _sectionTitle(AppLocalizations.of(context)!.support),
                    const SizedBox(height: 8),
                    _navTile(
                      icon: LucideIcons.lifeBuoy,
                      title: AppLocalizations.of(context)!.helpSupport,
                      subtitle: AppLocalizations.of(context)!.helpSupportSubtitle,
=======
                      title: 'Terms of Service',
                      subtitle: 'Usage terms & conditions',
                      onTap: () => context.go('/terms-conditions'),
                    ),
                    const SizedBox(height: 14),
                    _sectionTitle('Support'),
                    const SizedBox(height: 8),
                    _navTile(
                      icon: LucideIcons.lifeBuoy,
                      title: 'Help & Support',
                      subtitle: 'Get assistance',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                      onTap: () => context.go('/help-support'),
                    ),
                    _navTile(
                      icon: LucideIcons.info,
<<<<<<< HEAD
                      title: AppLocalizations.of(context)!.about,
                      subtitle: AppLocalizations.of(context)!.aboutSubtitle,
                      onTap: () => context.go('/about-us'),
                    ),
                    const SizedBox(height: 16),
                    _govCard(context),
=======
                      title: 'About',
                      subtitle: 'Know more about Farmaura',
                      onTap: () => context.go('/about-us'),
                    ),
                    const SizedBox(height: 16),
                    _govCard(),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _topCard(BuildContext context) {
=======
  Widget _topCard() {
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark]),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.15), blurRadius: 14, offset: const Offset(0, 8))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.18), borderRadius: BorderRadius.circular(12)),
            child: const Icon(LucideIcons.settings, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
<<<<<<< HEAD
              children: [
                Text(AppLocalizations.of(context)!.settings, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text('Manage your preferences', style: TextStyle(color: Colors.white70)),
=======
              children: const [
                Text('Settings', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                SizedBox(height: 4),
                Text('Manage your preferences', style: TextStyle(color: Colors.white70)),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(text, style: const TextStyle(color: AppColors.primaryDark, fontSize: 16, fontWeight: FontWeight.w700));
  }

  Widget _toggleTile({required IconData icon, required String title, required String subtitle, required bool value, required ValueChanged<bool> onChanged}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 8))]),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryDark),
        title: Text(title, style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: const TextStyle(color: AppColors.muted)),
        trailing: Switch(value: value, onChanged: onChanged),
        onTap: () => onChanged(!value),
      ),
    );
  }

  Widget _navTile({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 8))]),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryDark),
        title: Text(title, style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: const TextStyle(color: AppColors.muted)),
        trailing: const Icon(Icons.chevron_right, color: AppColors.muted),
        onTap: onTap,
      ),
    );
  }

<<<<<<< HEAD
  Widget _govCard(BuildContext context) {
=======
  Widget _govCard() {
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 8))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
<<<<<<< HEAD
        children: [
          const Icon(LucideIcons.badgeCheck, color: AppColors.primaryDark),
          const SizedBox(width: 12),
=======
        children: const [
          Icon(LucideIcons.badgeCheck, color: AppColors.primaryDark),
          SizedBox(width: 12),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
<<<<<<< HEAD
                Text(AppLocalizations.of(context)!.govJharkhand, style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(AppLocalizations.of(context)!.govSubtitle, style: const TextStyle(color: AppColors.muted)),
                const SizedBox(height: 6),
                Text('${AppLocalizations.of(context)!.version} 1.0.0', style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w600)),
=======
                Text('Government of Jharkhand', style: TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w700)),
                SizedBox(height: 4),
                Text('Empowering farmers with digital advisory and market access.', style: TextStyle(color: AppColors.muted)),
                SizedBox(height: 6),
                Text('Version 1.0.0', style: TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w600)),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
              ],
            ),
          ),
        ],
      ),
    );
  }
}
