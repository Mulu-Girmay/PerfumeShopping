import 'package:flutter/material.dart';

class PerfumeDetailPage extends StatelessWidget {
  const PerfumeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF9F3F0), Color(0xFFBE948B)],
                stops: [0.0, 0.72],
              ),
            ),
          ),
        ),
        Positioned(
          top: 26,
          left: 12,
          right: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.menu_rounded, color: Color(0xFF8B5E57), size: 30),
              Icon(
                Icons.favorite_border_rounded,
                color: Color(0xFF8B5E57),
                size: 26,
              ),
            ],
          ),
        ),
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 72, 20, 130),
            child: Column(
              children: [
                const Text(
                  'AQUA UNIVERSALIS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6F3642),
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 360),
                  padding: const EdgeInsets.fromLTRB(20, 26, 20, 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.96),
                    borderRadius: BorderRadius.circular(34),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x22000000),
                        blurRadius: 24,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 210,
                        height: 260,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1541643600914-e0fdc6e6f8d0?w=400',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.local_florist_rounded, size: 80),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          final active = index == 0;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: active ? 18 : 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: active
                                  ? const Color(0xFF8B5E57)
                                  : const Color(0xFFE0C8C2),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -18),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 360),
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 26),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB89284),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'AQUA UNIVERSALIS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.4,
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          'Blur gender boundaries and be unconventionally free\nwith this flowery-vanilla eau de parfum. In the heart of\nthe fragrance,',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFF8EDE8),
                            fontSize: 13,
                            height: 1.35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          '£70.00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 360),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.88),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.shopping_basket_outlined,
                        color: Color(0xFF8B5E57),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Add to basket',
                        style: TextStyle(
                          color: Color(0xFF6F3642),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
