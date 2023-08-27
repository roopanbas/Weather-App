import 'dart:ui';

import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xff1b1d1f);
const kWhite = Colors.black; // Color(0xfff3f3f3);
const kGrey = Colors.grey;

// gradient
BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: const LinearGradient(
        colors: [Color(0xff9944d1), Color(0xff5d29cd)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight));



class GlassMorphism extends StatelessWidget {
  final Widget child;
  final double start;
  final double end;
  const GlassMorphism({
    Key? key,
    required this.child,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 160, 160, 160).withOpacity(start),
                Color.fromARGB(255, 179, 179, 179).withOpacity(end),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            // borderRadius: BorderRadius.all(Radius.circular(10)),
            // border: Border.all(
            //   width: 1.5,
            //   color: Colors.white.withOpacity(0.2),
            // ),
          ),
          child: child,
        ),
      ),
    );
  }
}
