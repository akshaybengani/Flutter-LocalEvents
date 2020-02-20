import 'package:flutter/material.dart';

class HomePageBackground extends StatelessWidget {
  final screenHeight;

// This is the constructor which takes the value of screen height from HomePage.dart
  HomePageBackground({this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        // The container height will be dynamic based on screen height and it works in both directions
        height: screenHeight * 0.5,
        // Theme colors are defined in main.dart file
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

// This clipper is used to draw the shape at the end
class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0,size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    path.lineTo(curveStartPoint.dx, curveEndPoint.dy);
    path.quadraticBezierTo(size.width/2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width,0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
