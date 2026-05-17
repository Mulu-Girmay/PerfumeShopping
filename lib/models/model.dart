import 'package:flutter/material.dart';

class PerfumeData {
  final String title;
  final String subtitle;
  final String price;
  final Color backgroundColor;
  final String? imageUrl;
  final List<String>? images;
  final String? description;
  final bool isDarkText;

  PerfumeData({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.backgroundColor,
    this.imageUrl,
    this.images,
    this.description,
    this.isDarkText = false,
  });
}
