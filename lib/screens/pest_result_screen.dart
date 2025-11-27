import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:lucide_icons/lucide_icons.dart';
import '../models/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/floating_ivr.dart';
import 'package:farmaura/l10n/app_localizations.dart';
=======
import '../models/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';
import '../widgets/floating_ivr.dart';
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee

class PestResultScreen extends StatelessWidget {
  const PestResultScreen({super.key, required this.appState});
  final AppState appState;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    final steps = const [
      'Remove infected leaves to prevent spread.',
      'Apply copper-based fungicide @2g/liter.',
      'Improve air circulation and avoid overhead irrigation.',
    ];

>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
<<<<<<< HEAD
                AppHeader(title: AppLocalizations.of(context)!.pestDetection, showBack: true, showProfile: false, appState: appState, onBack: () => Navigator.of(context).pop()),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(24),
                            image: const DecorationImage(
                              image: NetworkImage('https://images.unsplash.com/photo-1599527676769-656910793693?w=800&auto=format&fit=crop&q=60'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.red.shade200),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 32),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(AppLocalizations.of(context)!.leafBlightDetected, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
                                        Text(AppLocalizations.of(context)!.severityHigh, style: const TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(AppLocalizations.of(context)!.recommendedActions, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        _ActionCard(
                          title: AppLocalizations.of(context)!.chemicalControl,
                          description: 'Spray Mancozeb 75 WP @ 2g/liter of water. Repeat after 10-12 days if necessary.',
                          icon: LucideIcons.flaskConical,
                          color: Colors.orange,
                        ),
                        _ActionCard(
                          title: AppLocalizations.of(context)!.biologicalControl,
                          description: 'Use Trichoderma viride @ 5g/liter for seed treatment before sowing.',
                          icon: LucideIcons.leaf,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F8E9),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFC8E6C9)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.lightbulb_outline, color: Colors.green, size: 24),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppLocalizations.of(context)!.organicAlternativeTitle, style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 4),
                                    Text(
                                      AppLocalizations.of(context)!.organicAlternativeDesc,
                                      style: const TextStyle(color: AppColors.primaryDark, fontSize: 13, height: 1.4),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
=======
                AppHeader(title: 'Pest Result', showBack: true, showProfile: false, appState: appState),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 10))]),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(color: Colors.red.shade50, shape: BoxShape.circle),
                                child: const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 38),
                              ),
                              const SizedBox(height: 10),
                              const Text('Leaf Blight Detected', style: TextStyle(color: AppColors.primaryDark, fontSize: 18, fontWeight: FontWeight.w700)),
                              const SizedBox(height: 6),
                              const Text('Severity: High (85%)', style: TextStyle(color: AppColors.muted)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 8))]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Recommended Actions', style: TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w700)),
                              const SizedBox(height: 8),
                              ...steps.map((s) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(width: 8, height: 8, margin: const EdgeInsets.only(top: 6), decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                                        const SizedBox(width: 8),
                                        Expanded(child: Text(s, style: const TextStyle(color: AppColors.primaryDark))),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.blue.shade200)),
                          child: const Text('Organic alternative: Spray neem oil solution (5ml/liter) mixed with garlic extract.', style: TextStyle(color: AppColors.primaryDark)),
                        ),
                        const SizedBox(height: 16),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
<<<<<<< HEAD
                                onPressed: () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  side: const BorderSide(color: AppColors.primary),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                ),
                                child: Text(AppLocalizations.of(context)!.scanAgain, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
                              ),
                            ),
                            const SizedBox(width: 16),
=======
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  side: const BorderSide(color: AppColors.primary, width: 2),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: const Text('Scan Again', style: TextStyle(color: AppColors.primary)),
                              ),
                            ),
                            const SizedBox(width: 10),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
<<<<<<< HEAD
                                  backgroundColor: AppColors.primary,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  elevation: 0,
                                ),
                                child: Text(AppLocalizations.of(context)!.saveReport, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
=======
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Save Report'),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
<<<<<<< HEAD
=======
            const Positioned(bottom: 0, left: 0, right: 0, child: AppFooter()),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
            const FloatingIVR(),
          ],
        ),
      ),
    );
  }
}
<<<<<<< HEAD

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryDark)),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(color: AppColors.muted, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
=======
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
