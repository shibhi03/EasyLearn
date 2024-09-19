import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'color.dart' as clr;
import 'fontSize.dart' as fnt;

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://www.youtube.com/watch?v=svQOxQde0bg'),
    )..initialize().then((_) {
        setState(
            () {}); // Ensures that the video player is built after initialization
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr.Colors.appBackgroundColor, // Background color
      body: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Transform.rotate(
                  angle: 3.1,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: CircleAvatar(
                      radius: 25,
                      backgroundColor: clr.Colors.boxColor,
                      child: Image.asset(
                        'assetsDir/Images/arrowheadYellow.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: clr.Colors.boxColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Introduction", // Video title
                  style: TextStyle(
                    fontSize: 24,
                    color: clr.Colors.boxBodyColor,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Video player container
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(
                      height: 200,
                      color:
                          Colors.grey, // Placeholder until video is initialized
                    ),
              Spacer(),
              // Play Next Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: clr.Colors.buttonColor,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  // Replace this with navigation to the next video
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NextVideoScreen(), // Imaginary next video screen
                    ),
                  );
                },
                icon: Image.asset(
                  'assetsDir/Images/playNext.png',
                  width: 30,
                  height: 30,
                ),
                label: Text(
                  "Play Next",
                  style: TextStyle(
                    fontSize: 18,
                    color: clr.Colors.buttonContentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example for the next video screen (replace this as needed)
class NextVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Next Video Screen'),
      ),
    );
  }
}
