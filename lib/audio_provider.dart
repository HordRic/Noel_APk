import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioProvider() {
    _init();
  }

  Future<void> _init() async {
    await _audioPlayer.setAsset('assets/audio/christmas_music.mp3');
    _audioPlayer.setLoopMode(LoopMode.all);
    _audioPlayer.play();
  }

  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}