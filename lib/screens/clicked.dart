import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class Clicked extends StatefulWidget {
  const Clicked({Key? key}) : super(key: key);

  @override
  State<Clicked> createState() => _ClickedState();
}

class _ClickedState extends State<Clicked> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('videos/video2.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      showControls: false,
    );

    _videoPlayerController.addListener(() {
      print('Video playback state: ${_videoPlayerController.value.isPlaying}');
      print('Video player error: ${_videoPlayerController.value.errorDescription}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
    _videoPlayerController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
                height: MediaQuery.of(context).size.height *0.49,
                width: MediaQuery.of(context).size.width,
                child: Chewie(controller: _chewieController),
            ),

          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:
                  MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  "Live",
                  style: GoogleFonts.jost(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  "it up!",
                  style: GoogleFonts.jost(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Crafted with ♥️ in Bengaluru, India      ",
                  style: GoogleFonts.jost(
                    fontSize: 20,
                    color: Colors.grey[600],
                  ),
                )
              ],
            ),
          ),
        ],
      ),

    );
  }

}
