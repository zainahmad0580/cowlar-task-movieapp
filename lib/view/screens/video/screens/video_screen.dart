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
    // Set preferred orientations for landscape mode so that video can be seen in full screen initially
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onEnded: (metaData) {
            //Switch back to portrait mode
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            //Go back to details screen after movie is completed
            Navigator.pop(context);
          }),
      builder: (context, player) =>
          Scaffold(body: SafeArea(child: Center(child: player))),
    );
  }
}
