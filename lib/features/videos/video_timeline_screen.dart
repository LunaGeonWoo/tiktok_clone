import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 2;

  final PageController _pageController = PageController();
  final Duration _scrollDuration = const Duration(milliseconds: 250);
  final Curve _scrollCuve = Curves.linear;

  List<Color> colors = [
    Colors.red,
    Colors.blue,
  ];

  void _onPageChange(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCuve,
    );
    if (page == _itemCount - 1) {
      _itemCount += 2;
      colors.addAll([
        Colors.red,
        Colors.blue,
      ]);
      setState(() {});
    }
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCuve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      pageSnapping: true,
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChange,
      itemCount: _itemCount,
      itemBuilder: (context, index) =>
          VideoPost(onVideoFinished: _onVideoFinished),
    );
  }
}
