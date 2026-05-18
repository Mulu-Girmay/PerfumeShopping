import 'package:flutter/material.dart';

class ReusablePerfumeCard extends StatelessWidget {
  const ReusablePerfumeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.backgroundColor = const Color(0xFFC9A69E),
    this.imageUrl,
    this.onTap,
    this.isDarkText = false,
    this.category,
  });

  final String title;
  final String subtitle;
  final String price;
  final Color backgroundColor;
  final String? imageUrl;
  final VoidCallback? onTap;
  final bool isDarkText;
  final String? category;

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkText ? const Color(0xFF6F3642) : Colors.white;
    final mutedColor = isDarkText
        ? const Color(0xFF9C6F69)
        : const Color(0xFFF8EDE8);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color(0x15000000),
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 14, 12, 0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            if (category != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  category!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mutedColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            Expanded(
              child: Center(
                child: imageUrl != null
                    ? (imageUrl!.startsWith('assets/')
                          ? Image.asset(
                              imageUrl!,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.image_not_supported_outlined,
                                  color: textColor.withOpacity(0.5),
                                  size: 48,
                                );
                              },
                            )
                          : Image.network(
                              imageUrl!,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.image_not_supported_outlined,
                                  color: textColor.withOpacity(0.5),
                                  size: 48,
                                );
                              },
                            ))
                    : Icon(
                        Icons.local_florist_rounded,
                        color: textColor.withOpacity(0.6),
                        size: 64,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                children: [
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
