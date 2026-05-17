import 'package:flutter/material.dart';
import 'package:perfumeshopping/models/model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.perfume});

  final PerfumeData perfume;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    final perfume = widget.perfume;
    final images =
        perfume.images ?? [if (perfume.imageUrl != null) perfume.imageUrl!];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F3F0),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar + title
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: Color(0xFF8B5E57),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      perfume.title.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF6F3642),
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Large bottle card
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.82,
                      height: MediaQuery.of(context).size.height * 0.46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(34),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x22000000),
                            blurRadius: 24,
                            offset: Offset(0, 12),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(34),
                        child: PageView.builder(
                          itemCount: images.length,
                          controller: PageController(viewportFraction: 1.0),
                          onPageChanged: (i) =>
                              setState(() => _selectedImage = i),
                          itemBuilder: (context, index) {
                            final url = images[index];
                            return Center(
                              child: Image.network(
                                url,
                                fit: BoxFit.contain,
                                width: MediaQuery.of(context).size.width * 0.6,
                                errorBuilder: (c, e, s) => const Icon(
                                  Icons.local_florist_rounded,
                                  size: 120,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(images.length, (i) {
                        final active = i == _selectedImage;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
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
            ),

            // Info card (brown)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 22),
              decoration: const BoxDecoration(
                color: Color(0xFFB89284),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    perfume.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    perfume.description ?? 'No description available.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFF8EDE8),
                      fontSize: 13,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    perfume.price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),

            // Add to basket pill
            Padding(
              padding: const EdgeInsets.only(bottom: 18, top: 12),
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added ${perfume.title} to basket')),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x22000000),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.shopping_basket_outlined,
                        color: Color(0xFF8B5E57),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Add to basket',
                        style: TextStyle(
                          color: Color(0xFF6F3642),
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
