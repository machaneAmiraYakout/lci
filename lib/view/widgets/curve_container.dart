import 'package:flutter/material.dart';
import 'colors.dart';

class CurvedContainer extends StatelessWidget {
  late final double height;
  late final Color? color;
  CurvedContainer({required this.height,this.color=buttonColor});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomContainerClipper(),
      child: Container(
        color: color,
        height:height,

      ),
    );
  }
}
class CustomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height); // Move to the bottom left corner

    final controlPoint1 = Offset(size.width / 4, size.height - 50);
    final endPoint1 = Offset(size.width / 2, size.height - 50);
    path.quadraticBezierTo(
      controlPoint1.dx,
      controlPoint1.dy,
      endPoint1.dx,
      endPoint1.dy,
    );
    final controlPoint2 = Offset(size.width - (size.width / 4), size.height - 50);
    final endPoint2 = Offset(size.width, size.height - 100);
    path.quadraticBezierTo(
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint2.dx,
      endPoint2.dy,
    );
    path.lineTo(size.width, 0); // Connect to the top right corner
    path.lineTo(0, 0); // Connect to the top left corner
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

