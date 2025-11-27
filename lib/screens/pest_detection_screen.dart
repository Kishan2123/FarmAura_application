import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
<<<<<<< HEAD
import 'package:lucide_icons/lucide_icons.dart';
import '../models/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart'; // Assuming AppHeader is used or I'll use the custom header I wrote
import '../widgets/floating_ivr.dart';
import 'pest_result_screen.dart';
import 'package:farmaura/l10n/app_localizations.dart';

class PestDetectionScreen extends StatefulWidget {
=======
import '../models/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';
import '../widgets/floating_ivr.dart';

class PestDetectionScreen extends StatelessWidget {
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
  const PestDetectionScreen({super.key, required this.appState});
  final AppState appState;

  @override
<<<<<<< HEAD
  State<PestDetectionScreen> createState() => _PestDetectionScreenState();
}

class _PestDetectionScreenState extends State<PestDetectionScreen> {
  @override
=======
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
<<<<<<< HEAD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.canPop(context) ? context.pop() : context.go('/dashboard'),
                        icon: const Icon(LucideIcons.arrowLeft, color: AppColors.primaryDark),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey.shade200)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(AppLocalizations.of(context)!.back, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryDark)),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
                          child: const Icon(LucideIcons.scanLine, size: 64, color: AppColors.primary),
                        ),
                        const SizedBox(height: 24),
                        Text(AppLocalizations.of(context)!.pestDetection, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryDark)),
                        const SizedBox(height: 12),
                        Text(
                          AppLocalizations.of(context)!.pestDetectionSubtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16, color: AppColors.muted, height: 1.5),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blue.shade100),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.info_outline, color: Colors.blue),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.pestDetectionInfo,
                                  style: const TextStyle(color: AppColors.primaryDark, height: 1.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        _actionButton(
                          icon: LucideIcons.camera,
                          label: AppLocalizations.of(context)!.openCamera,
                          color: AppColors.primary,
                          onTap: () {
                            // Simulate processing
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PestResultScreen(appState: widget.appState)));
                          },
                        ),
                        const SizedBox(height: 16),
                        _actionButton(
                          icon: LucideIcons.image,
                          label: AppLocalizations.of(context)!.uploadImage,
                          color: AppColors.accent,
                          isOutlined: true,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PestResultScreen(appState: widget.appState)));
                          },
=======
                AppHeader(appState: appState),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () => context.go('/dashboard'),
                          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                          label: const Text('Back', style: TextStyle(color: AppColors.primary)),
                        ),
                        const SizedBox(height: 4),
                        Text('Pest Detection', style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 6),
                        const Text('Upload or capture plant image for AI analysis', style: TextStyle(color: AppColors.muted)),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.orange.shade200)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.info_outline, color: AppColors.primaryDark),
                              SizedBox(width: 8),
                              Expanded(child: Text('Upload 4-5 images from different angles for accurate detection.')),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: Center(
                            child: _AddImagesCard(appState: appState),
                          ),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
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
<<<<<<< HEAD

  Widget _actionButton({required IconData icon, required String label, required Color color, required VoidCallback onTap, bool isOutlined = false}) {
    return Material(
      color: isOutlined ? Colors.transparent : color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: isOutlined
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: color, width: 2),
                )
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isOutlined ? color : Colors.white),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isOutlined ? color : Colors.white),
              ),
            ],
          ),
=======
}

class _AddImagesCard extends StatelessWidget {
  const _AddImagesCard({required this.appState});
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      child: Container(
        constraints: BoxConstraints(minHeight: size.height * 0.35),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 10))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(color: AppColors.background, shape: BoxShape.circle),
              child: const Icon(Icons.camera_alt, size: 48, color: AppColors.primaryDark),
            ),
            const SizedBox(height: 12),
            const Text('Add Images', style: TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => context.go('/camera'),
              icon: const Icon(Icons.camera_alt),
              label: const Text('Open Camera'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () => context.go('/upload-image'),
              icon: const Icon(Icons.upload_file),
              label: const Text('Upload Image'),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                side: const BorderSide(color: AppColors.primary, width: 2),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              ),
            ),
          ],
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
        ),
      ),
    );
  }
}
