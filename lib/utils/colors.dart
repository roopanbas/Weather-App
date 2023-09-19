import 'dart:ui';
import 'package:flutter/material.dart';

// gradient
BoxDecoration boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  gradient: const LinearGradient(
      colors: [Color(0xff9944d1), Color(0xff5d29cd)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight),
);
