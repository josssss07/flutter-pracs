// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 AudioPlayer player =
      AudioPlayer(); // this line will create the instance of the audio player class
  bool isPlaying = false; //helps us detect if audio is playing correctly
  Duration duration = Duration.zero; //state variables
  Duration position =
      Duration.zero; //state variables //current play back position

  @override
  void initState() {
    //life cycle method in flutter // will insert our widget into the widget tree once it has been called
    super.initState();
    setAudio(); //future async user defined method used to initialize the audio setup

    //We will use 3 listeners to react to the changes in the audio player state whenever the player is played paused or stopped, isPlaying bool variable is updated

    //similarly duration and position should be updated

    //listeners are added to keep track of the audio and update the state variables

    //listen to the states of the audio: playing, pause, stopped,
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Play the sound of the bird'),
          backgroundColor: Colors.grey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://unsplash.com/photos/black-and-white-bird-on-brown-dried-leaves-4CAey3bNlE8',
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Wild Babbler sings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'free source',
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                //widget which permits the user to interactively change the position (seek) of the audio play back
                min: 0, //sets minimum value of the slider
                max: duration.inSeconds
                    .toDouble(), //sets the length of the audio
                value: duration.inSeconds
                    .toDouble(), //current time value and the current playback position of the audio

                onChanged: (value) async {
                  //callback method that is triggered each time the user interacts with the slider
                  //value represents the current position
                  final position = Duration(
                      seconds: value
                          .toInt()); // this converts the chosen value or position into int
                  await player.seek(
                      position); // this invokes the seek method on the audio player to change to the curent playing position

                  //optional
                  await player
                      .resume(); // resumes the player if it was paused, it will automatically play back at the new position
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(position)),
                    ],
                  )),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  iconSize: 50,
                  onPressed: () async {
                    if (isPlaying) {
                      await player.pause();
                    } else {
                      //if the audio is not currently playing, isPlaying bool variable will evaluate to false thus executing the else  block which creates a new instance of audio cache called mplayer
                      final mplayer =
                          AudioCache(); //mplayer object will be used to load the audio file which is in mp3 format
                      await mplayer.load('bird_audio.mp3');
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }


  //HELPER FUNCTIONS

  //the function that performs part of the computation of another function. These are used to make the program easier to read. They assist in code reusability

  //twoDigits is a helper function that takes argument n and converts into String
  
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0'); // padLeft ensures that resulting string will have atleast 2 digits, padding with 0 if necessary, example '05'
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  Future setAudio() async {
    player.setReleaseMode(ReleaseMode.loop);
    final mplayer = AudioCache(prefix: 'assets/audio');
    final url = await mplayer.load('');
    player.setSource(url.path as Source);
  }
}