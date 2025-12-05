import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../models/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';

class FarmerVideosScreen extends StatefulWidget {
  const FarmerVideosScreen({super.key, required this.appState});
  final AppState appState;

  @override
  State<FarmerVideosScreen> createState() => _FarmerVideosScreenState();
}

class _FarmerVideosScreenState extends State<FarmerVideosScreen> {
  YoutubePlayerController? _controller;
  String? _currentVideoId;
  bool _isPlayerReady = false;

  final List<Map<String, String>> videos = const [
    {
      'title': 'FarmAura - Smart Farming Guide',
      'description': 'Complete guide to using FarmAura for better farming',
      'videoId': 'NB8y-fikBLg',
      'duration': '5:32',
      'category': 'Tutorial',
    },
    {
      'title': 'Organic Pest Control Methods',
      'description': 'Natural ways to control pests without chemicals',
      'videoId': 'qTkp-9o9hH0',
      'duration': '8:15',
      'category': 'Pest Control',
    },
    {
      'title': 'Drip Irrigation Setup',
      'description': 'Step-by-step guide to install drip irrigation',
      'videoId': 'NB8y-fikBLg',
      'duration': '6:45',
      'category': 'Irrigation',
    },
    {
      'title': 'Soil Health Management',
      'description': 'How to improve and maintain soil quality',
      'videoId': 'ImAqdPGQ3Vc',
      'duration': '01:25',
      'category': 'Soil Care',
    },
     {
      'title': 'Soil Health Card (SHC)',
      'description': 'How to Apply for Soil Health Card (SHC)',
      'videoId': 'ViYTVlOA1FY',
      'duration': '01:00',
      'category': 'Soil Care',
    },
    {
      'title': 'Crop Rotation Techniques',
      'description': 'Maximize yield with proper crop rotation',
      'videoId': 'NB8y-fikBLg',
      'duration': '9:10',
      'category': 'Farming Tips',
    },
  ];

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _playVideo(String videoId, String title) {
    setState(() {
      _currentVideoId = videoId;
      _isPlayerReady = false;
    });

    _controller?.dispose();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: true,
        controlsVisibleAtStart: true,
      ),
    )..addListener(() {
        if (mounted && _controller!.value.isReady && !_isPlayerReady) {
          setState(() {
            _isPlayerReady = true;
          });
        }
      });
  }

  void _closePlayer() {
    setState(() {
      _controller?.pause();
      _controller?.dispose();
      _controller = null;
      _currentVideoId = null;
      _isPlayerReady = false;
    });
  }

  String _getThumbnailUrl(String videoId) {
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                AppHeader(
                  title: 'Educational Videos',
                  showBack: true,
                  showProfile: false,
                  appState: widget.appState,
                ),
                Expanded(
                  child: Column(
                    children: [
                      // Picture-in-Picture Video Player
                      if (_controller != null && _currentVideoId != null)
                        Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              YoutubePlayer(
                                controller: _controller!,
                                showVideoProgressIndicator: true,
                                progressIndicatorColor: AppColors.primary,
                                bottomActions: [
                                  CurrentPosition(),
                                  ProgressBar(
                                    isExpanded: true,
                                    colors: ProgressBarColors(
                                      playedColor: AppColors.primary,
                                      handleColor: AppColors.primaryDark,
                                    ),
                                  ),
                                  RemainingDuration(),
                                  const PlaybackSpeedButton(),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors.black87,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        videos.firstWhere(
                                          (v) => v['videoId'] == _currentVideoId,
                                          orElse: () => {'title': 'Video'},
                                        )['title']!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        LucideIcons.x,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      onPressed: _closePlayer,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      // Video List
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                          itemCount: videos.length,
                          itemBuilder: (context, index) {
                            final video = videos[index];
                            final isPlaying = _currentVideoId == video['videoId'];
                            
                            return _VideoCard(
                              title: video['title']!,
                              description: video['description']!,
                              thumbnailUrl: _getThumbnailUrl(video['videoId']!),
                              duration: video['duration']!,
                              category: video['category']!,
                              isPlaying: isPlaying,
                              onTap: () => _playVideo(video['videoId']!, video['title']!),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(bottom: 0, left: 0, right: 0, child: AppFooter()),
          ],
        ),
      ),
    );
  }
}

class _VideoCard extends StatelessWidget {
  const _VideoCard({
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.duration,
    required this.category,
    required this.isPlaying,
    required this.onTap,
  });

  final String title;
  final String description;
  final String thumbnailUrl;
  final String duration;
  final String category;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isPlaying
              ? Border.all(color: AppColors.primary, width: 2)
              : null,
          boxShadow: [
            BoxShadow(
              color: isPlaying
                  ? AppColors.primary.withOpacity(0.2)
                  : Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail with play button
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    thumbnailUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey[300],
                        child: const Icon(
                          LucideIcons.video,
                          size: 48,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                // Play button overlay
                if (!isPlaying)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            LucideIcons.play,
                            color: AppColors.primary,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                // Now Playing indicator
                if (isPlaying)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                LucideIcons.playCircle,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Now Playing',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                // Duration badge
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      duration,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                // Category badge
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: isPlaying
                          ? AppColors.primaryDark
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Video info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isPlaying
                          ? AppColors.primary
                          : AppColors.primaryDark,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.muted,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
