import 'package:flutter/material.dart';

class PerfumeData {
  final String title;
  final String subtitle;
  final String price;
  final Color backgroundColor;
  final String? imageUrl;
  final bool isDarkText;

  PerfumeData({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.backgroundColor,
    this.imageUrl,
    this.isDarkText = false,
  });
}
