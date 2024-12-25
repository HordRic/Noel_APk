import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:joyeux_noel/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<SnowBall> _snows;
  late bool _isRunning;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    // Démarrer la musique
    _audioPlayer = AudioPlayer();
    _playMusic();

    _isRunning = true;

    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..addListener(() {
        setState(() {
          for (var snow in _snows) {
            snow.y += 2;
            if (snow.y > MediaQuery.of(context).size.height) {
              snow.y = 0;
              snow.x =
                  Random().nextDouble() * MediaQuery.of(context).size.width;
            }
          }
        });
      });

    _controller.repeat();

    Timer(Duration(seconds: 6), () {
      _isRunning = false;
      _audioPlayer.stop();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }

  Future<void> _playMusic() async {
    await _audioPlayer.play(AssetSource('audio/christmas_music.mp3'));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialiser les flocons de neige après que le contexte soit complètement initialisé
    _snows = List.generate(100, (index) {
      return SnowBall(
        x: Random().nextDouble() * MediaQuery.of(context).size.width,
        y: Random().nextDouble() * MediaQuery.of(context).size.height,
        radius: Random().nextDouble() * 4 + 2,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("images/splash-img.jpg"),
                fit: BoxFit.cover,
                opacity: 0.6,
              ),
            ),
            child: Center(
              child: Text(
                "Merry\n Christmas",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          CustomPaint(
            painter: SnowPainter(
              isRunning: _isRunning,
              snows: _snows,
              snowColor: Colors.white,
              hasSpinningEffect: true,
            ),
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class SnowBall {
  double x;
  double y;
  double radius;

  SnowBall({required this.x, required this.y, required this.radius});
}

class SnowPainter extends CustomPainter {
  final List<SnowBall> snows;
  final bool isRunning;
  final Color snowColor;
  final bool hasSpinningEffect;

  SnowPainter({
    required this.isRunning,
    required this.snows,
    required this.snowColor,
    required this.hasSpinningEffect,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint;

    if (hasSpinningEffect) {
      paint = Paint()
        ..shader = LinearGradient(
          colors: [snowColor, snowColor.withOpacity(0.6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.mirror,
        ).createShader(Rect.fromCircle(
          center: const Offset(0, 0),
          radius: 15,
        ));
    } else {
      paint = Paint()..color = snowColor;
    }

    for (int i = 0; i < snows.length; i++) {
      SnowBall snow = snows[i];
      canvas.drawCircle(Offset(snow.x, snow.y), snow.radius, paint);
    }
  }

  @override
  bool shouldRepaint(SnowPainter oldDelegate) => isRunning;
}
