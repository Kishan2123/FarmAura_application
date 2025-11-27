import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../models/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';
import '../widgets/floating_ivr.dart';
import 'why_this_crop_screen.dart';

<<<<<<< HEAD
import 'package:farmaura/l10n/app_localizations.dart';

=======
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
class RecommendationResultsScreen extends StatelessWidget {
  const RecommendationResultsScreen({super.key, required this.appState});
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    final recs = [
      _Rec(
<<<<<<< HEAD
        AppLocalizations.of(context)!.cotton,
        AppLocalizations.of(context)!.excellentSoilMatch,
=======
        'Cotton',
        'Excellent soil match',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
        '95%',
        '₹85,000',
        '18-20 quintals/acre',
        'assets/icons/cotton.png', // Placeholder path
        LucideIcons.sprout,
        true,
        Colors.green,
        1,
      ),
      _Rec(
<<<<<<< HEAD
        AppLocalizations.of(context)!.soybean,
        AppLocalizations.of(context)!.rotationBenefit,
=======
        'Soybean',
        'Good rotation benefit',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
        '88%',
        '₹65,000',
        '12-15 quintals/acre',
        'assets/icons/soybean.png', // Placeholder path
        LucideIcons.bean,
        true,
        Colors.orange,
        2,
      ),
      _Rec(
<<<<<<< HEAD
        AppLocalizations.of(context)!.maize,
        AppLocalizations.of(context)!.weatherSuitability,
=======
        'Maize',
        'Favorable weather',
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
        '82%',
        '₹55,000',
        '25-30 quintals/acre',
        'assets/icons/corn.png', // Placeholder path
        LucideIcons.wheat,
        true,
        Colors.brown,
        3,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
<<<<<<< HEAD
                AppHeader(title: AppLocalizations.of(context)!.recommendedCrops, showBack: true, showProfile: false, appState: appState, onBack: () => Navigator.of(context).pop()),
=======
                AppHeader(title: 'Recommended Crops', showBack: true, showProfile: false, appState: appState, onBack: () => Navigator.of(context).pop()),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
<<<<<<< HEAD
                        Text(AppLocalizations.of(context)!.basedOnFarmConditions, style: const TextStyle(color: AppColors.muted, fontSize: 14)),
=======
                        const Text('Based on your farm conditions', style: TextStyle(color: AppColors.muted, fontSize: 14)),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                        const SizedBox(height: 16),
                        ...recs.map((r) => _RecommendationCard(rec: r, appState: appState)),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: const BorderSide(color: AppColors.primary),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
<<<<<<< HEAD
                            child: Text(AppLocalizations.of(context)!.tryDifferentInputs, style: const TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w600)),
=======
                            child: const Text('Try Different Inputs', style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w600)),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Positioned(bottom: 0, left: 0, right: 0, child: AppFooter()),
            const FloatingIVR(),
          ],
        ),
      ),
    );
  }
}

class _Rec {
  _Rec(this.title, this.subtitle, this.score, this.profit, this.yield, this.path, this.icon, this.isPositive, this.color, this.rank);
  final String title;
  final String subtitle;
  final String score;
  final String profit;
  final String yield;
  final String path;
  final IconData icon;
  final bool isPositive;
  final Color color;
  final int rank;
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.rec, required this.appState});
  final _Rec rec;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Placeholder for Crop Icon/Image
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: rec.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(rec.icon, color: rec.color, size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(rec.title, style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w700, fontSize: 18)),
                    Text(rec.subtitle, style: const TextStyle(color: AppColors.muted, fontSize: 12)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: rec.color, borderRadius: BorderRadius.circular(12)),
                child: Text('#${rec.rank}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
<<<<<<< HEAD
              Text(AppLocalizations.of(context)!.suitabilityScore, style: const TextStyle(color: AppColors.primaryDark, fontSize: 13)),
=======
              const Text('Suitability Score', style: TextStyle(color: AppColors.primaryDark, fontSize: 13)),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
              Text(rec.score, style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: double.parse(rec.score.replaceAll('%', '')) / 100,
              backgroundColor: Colors.grey.shade200,
              color: rec.color,
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
<<<<<<< HEAD
              Expanded(child: _StatBox(label: AppLocalizations.of(context)!.expectedProfit, value: rec.profit, subLabel: AppLocalizations.of(context)!.perAcre, icon: Icons.attach_money)),
              const SizedBox(width: 12),
              Expanded(child: _StatBox(label: AppLocalizations.of(context)!.yieldEstimate, value: rec.yield, icon: Icons.trending_up)),
=======
              Expanded(child: _StatBox(label: 'Expected Profit', value: rec.profit, subLabel: 'per acre', icon: Icons.attach_money)),
              const SizedBox(width: 12),
              Expanded(child: _StatBox(label: 'Yield Estimate', value: rec.yield, icon: Icons.trending_up)),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WhyThisCropScreen(appState: appState)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
<<<<<<< HEAD
                  child: Text(AppLocalizations.of(context)!.whyThisCrop, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
=======
                  child: const Text('Why This Crop?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => WhyThisCropScreen(appState: appState),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
<<<<<<< HEAD
                  child: Text(AppLocalizations.of(context)!.viewDetails, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
=======
                  child: const Text('View Details', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  const _StatBox({required this.label, required this.value, this.subLabel, required this.icon});
  final String label;
  final String value;
  final String? subLabel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: AppColors.muted),
              const SizedBox(width: 4),
              Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 11)),
            ],
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w700, fontSize: 14)),
          if (subLabel != null)
            Text(subLabel!, style: const TextStyle(color: AppColors.muted, fontSize: 10)),
        ],
      ),
    );
  }
}
