import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioProvider() {
    _init();
  }

  Future<void> _init() async {
    try {
      await _audioPlayer.setSource(AssetSource('audio/christmas_music.mp3'));
      _audioPlayer.setReleaseMode(ReleaseMode.loop);
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  void play() {
    _audioPlayer.resume();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
