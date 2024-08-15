import 'dart:isolate';
import 'dart:math';

import 'package:flutter/material.dart';

class ParticleAnimation extends StatefulWidget {
  const ParticleAnimation({super.key});

  @override
  State<ParticleAnimation> createState() => _ParticleAnimationState();
}

class _ParticleAnimationState extends State<ParticleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Offset> _particles = [];

  late Isolate _isolate;
  late ReceivePort _receivePort;
  SendPort? _sendPort;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    // Initialize the particles
    for (int i = 0; i < 1000; i++) {
      _particles.add(
          Offset(Random().nextDouble() * 300, Random().nextDouble() * 600));
    }

    _initializeIsolate();

    _controller.addListener(() {
      _sendPort?.send(_particles);
    });
  }

  void _initializeIsolate() async {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_particleCalculation, _receivePort.sendPort);

    _receivePort.listen((message) {
      if (message is SendPort) {
        _sendPort = message;
      } else if (message is List<Offset>) {
        setState(() {
          _particles = message;
        });
      }
    });
  }

  static void _particleCalculation(SendPort sendPort) {
    ReceivePort port = ReceivePort();
    sendPort.send(port.sendPort);

    port.listen((message) {
      if (message is List<Offset>) {
        List<Offset> updatedParticles = [];
        for (var particle in message) {
          updatedParticles.add(
            Offset(particle.dx + Random().nextDouble() * 4 - 2,
                particle.dy + Random().nextDouble() * 4 - 2),
          );
        }
        sendPort.send(updatedParticles);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _isolate.kill(priority: Isolate.immediate);
    _receivePort.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ParticlePainter(_particles),
      ),
    );
  }
}

class ParticlePainter extends CustomPainter {
  final List<Offset> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue;
    for (var particle in particles) {
      canvas.drawCircle(particle, 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
