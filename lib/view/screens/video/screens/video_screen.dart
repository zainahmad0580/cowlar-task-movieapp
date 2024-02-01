import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/utils/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final String videoKey;
  const VideoScreen({super.key, required this.videoKey});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(youtubeUrl + widget.videoKey)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        forceHD: true,
      ),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
// Set preferred orientations for landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // // Hide the system overlays (status bar, navigation bar)
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onEnded: (metaData) {
            // Switch back to portrait mode
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            //     overlays: []);
            Navigator.pop(context);
          }),
      builder: (context, player) =>
          Scaffold(body: SafeArea(child: Center(child: player))),
    );
  }
}
