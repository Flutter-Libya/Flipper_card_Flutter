import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: FlipCard()),
      ),
    );
  }
}

class FlipCard extends StatefulWidget {
  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  bool isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _frontAnimation;
  late Animation<double> _backAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _frontAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -pi / 2), weight: 0.5),
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 0.5),
    ]).animate(_controller);
    _backAnimation = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(pi / 2), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: pi / 2, end: 0.0), weight: 0.5),
    ]).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    setState(() {
      isFlipped = !isFlipped;
      isFlipped ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _backAnimation,
            builder: (BuildContext context, _) {
              return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(_backAnimation.value),
                child: Visibility(
                  visible: _controller.value >= 0.5,
                  child: _buildBackSide(),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _frontAnimation,
            builder: (BuildContext context, _) {
              return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(_frontAnimation.value),
                child: Visibility(
                  visible: _controller.value < 0.5,
                  child: _buildFrontSide(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFrontSide() {
    return Container(
      width: 190.0,
      height: 254.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4160D0),
            Color(0xFFC850C0),
            Color(0xFFFFCC70),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 0.5, //extend the shadow
          )
        ],
      ),
      child: Center(child: Text('Click Me', style: TextStyle(fontSize: 24, color: Colors.white))),
    );
  }

  Widget _buildBackSide() {
    return Container(
      width: 190.0,
      height: 254.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0093E9),
            Color(0xFF80D0C7),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 0.5, //extend the shadow
          )
        ],
      ),
      child: Center(child: Center(child: Text('Why You Did', style: TextStyle(fontSize: 24, color: Colors.white),),),),
    );
  }
}
