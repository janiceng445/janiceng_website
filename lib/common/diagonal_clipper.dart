import 'package:flutter/material.dart';

enum DiagonalClipperAlignment { left, center, right }

class DiagonalClipper extends CustomClipper<Path> {
  final DiagonalClipperAlignment alignment;
  final double steepness;

  const DiagonalClipper({
    required this.alignment,
    required this.steepness,
  });

  @override
  Path getClip(Size size) {
    Path path;

    if (alignment == DiagonalClipperAlignment.left) {
      path = Path()
        ..lineTo(0, 0)
        ..lineTo(size.width * 0.97, 0)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close();
    } else if (alignment == DiagonalClipperAlignment.right) {
      path = Path()
        ..lineTo(0, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width * 0.03, size.height)
        ..close();
    } else {
      path = Path()
        ..lineTo(0, 0)
        ..lineTo(size.width * 0.97, 0)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width * 0.03, size.height)
        ..close();
    }

    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
