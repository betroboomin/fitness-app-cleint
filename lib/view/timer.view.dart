import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class ExerciseData {
  final String name;
  final String image;
  final String description;
  

  ExerciseData({
    
    required this.name,
    required this.image,
    required this.description,
  });
}
class CountdownTimer extends StatefulWidget {
  final String exerciseIds;
  CountdownTimer({required this.exerciseIds});
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _secondsRemaining = 60;
  bool _timerRunning = false;
  Timer? _timer;
  ExerciseData? packageData;

  void _startTimer() {
    setState(() {
      _secondsRemaining = 5
          // 5*60
          ; // 5 minutes
      _timerRunning = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timerRunning = false;
          _timer?.cancel();
          _playAlarm();
        }
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _timerRunning = false;
    });

    _timer?.cancel();
  }

  void _playAlarm() async {
    HapticFeedback.vibrate();
    await FlutterRingtonePlayer.play(
      android: AndroidSounds.notification,
      ios: IosSounds.glass,
      looping: false,
      volume: 1.0,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  void fetchDataFromServer() async {
    try {
      final response = await http.get(
        Uri.parse(
          'http://192.168.229.195:4000/exercise/${widget.exerciseIds}',
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String name = responseData['name'];
        final String description = responseData['description'];
        final String image =
            'http://192.168.229.195:4000${responseData['image']}';
        final ExerciseData data =
            ExerciseData(description:description,name: name,image: image);

setState(() {
          packageData = data;
        });
      } else {
        // Handle error if the request is not successful
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer'),
      ),
      body:   Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             packageData != null
                ? Text(
              packageData!.name,
              style: TextStyle(fontSize: 24),
            ) : const Text(
                    'Name not available',
                    style: TextStyle(fontSize: 24),
                  ),
             packageData != null
                ? Text(
              packageData!.description,
              style: TextStyle(fontSize: 24),
            ) : const Text(
                    'Name not available',
                    style: TextStyle(fontSize: 24),
                  ),
            Text(
              _secondsRemaining.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
           
            SizedBox(height: 16),
            if (_timerRunning)
              ElevatedButton(
                child: Text('Stop'),
                onPressed: _stopTimer,
              )
            else
              ElevatedButton(
                child: Text('Start'),
                onPressed: _startTimer,
              ),
          ],
        ),
      );
    
  }
}
