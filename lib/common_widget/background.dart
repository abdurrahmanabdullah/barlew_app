
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String? image;
  const Background({super.key, required this.child, 
  this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image??Assets.images.background1.path),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
