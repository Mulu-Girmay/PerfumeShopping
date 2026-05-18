import 'package:flutter/material.dart';
import 'package:perfumeshopping/models/model.dart';
import 'package:perfumeshopping/models/cart.dart';

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
    final screenSize = MediaQuery.of(context).size;
    final imageCardHeight = (screenSize.height * 0.38).clamp(240.0, 360.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 18),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFF8B5E57),
                        size: 22,
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          perfume.title.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF6F3642),
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.4,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 70),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // Large bottle card
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: screenSize.width * 0.82,
                      height: imageCardHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(34),
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
                              child: url.startsWith('assets/')
                                  ? Image.asset(
                                      url,
                                      fit: BoxFit.contain,
                                      width: screenSize.width * 0.6,
                                    )
                                  : Image.network(
                                      url,
                                      fit: BoxFit.contain,
                                      width: screenSize.width * 0.6,
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

              // Info card (brown) with concave meniscus
              Transform.translate(
                offset: const Offset(0, 30),
                child: ClipPath(
                  clipper: ConcaveMeniscusClipper(),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 22),
                    decoration: const BoxDecoration(
                      color: Color(0xFFB89284),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                    ),
                    child: Column(
                      children: [
                        if (perfume.category.isNotEmpty)
                          Text(
                            perfume.category.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFFF8EDE8),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.6,
                            ),
                          ),
                        const SizedBox(height: 8),
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
                            fontSize: 14,
                            height: 1.45,
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
                ),
              ),
              const SizedBox(height: 20),
              // Add to basket pill
              Padding(
                padding: const EdgeInsets.only(bottom: 18, top: 12),
                child: GestureDetector(
                  onTap: () {
                    addToCart(perfume);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added ${perfume.title} to basket'),
                      ),
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
      ),
    );
  }
}

class ConcaveMeniscusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final meniscusDepth = 20.0;
    final centerX = size.width / 2;

    path.moveTo(0, 0);

    path.cubicTo(
      centerX * 0.5,
      meniscusDepth,
      centerX * 1.5,
      meniscusDepth,
      size.width,
      0,
    );

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(ConcaveMeniscusClipper oldClipper) => false;
}
