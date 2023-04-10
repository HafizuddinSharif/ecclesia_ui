import 'package:flutter/material.dart';

// The start-up screen

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..animateTo(100);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Welcome to'),
              Icon(Icons.how_to_vote, size: 100),
              Text(
                'Pebble Vote',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
              Text('E-voting platform powered by E-cclesia'),
            ],
          ),
        ),
      ),
    );
  }
}
