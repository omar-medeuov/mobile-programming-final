import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _bigLogo = false;
  bool _showCard = false;
  bool _faded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Demo')),
      body: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 800),
              curve: Curves.elasticOut,
              width: _bigLogo ? 180 : 100,
              height: _bigLogo ? 180 : 100,
              child: FlutterLogo(),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            left: _showCard ? 24 : MediaQuery.of(context).size.width,
            top: 300,
            right: 24,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Sliding in with style!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            bottom: 80,
            child: AnimatedOpacity(
              opacity: _faded ? 1 : 0,
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              child: Text(
                "Hello, animation!",
                style: TextStyle(fontSize: 22, color: Colors.purple),
              ),
            ),
          ),
          Positioned(
            right: 24,
            bottom: 32,
            child: FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _bigLogo = !_bigLogo;
                  _showCard = !_showCard;
                  _faded = !_faded;
                });
              },
              label: Text("Animate!"),
              icon: Icon(Icons.play_arrow),
            ),
          ),
        ],
      ),
    );
  }
}
