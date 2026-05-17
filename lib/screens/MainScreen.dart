import 'package:flutter/material.dart';
import 'package:perfumeshopping/models/model.dart';
import 'package:perfumeshopping/widget/reusablecard.dart';

class PerfumeBoutiqueApp extends StatefulWidget {
  const PerfumeBoutiqueApp({super.key});

  @override
  State<PerfumeBoutiqueApp> createState() => _PerfumeBoutiqueAppState();
}

class _PerfumeBoutiqueAppState extends State<PerfumeBoutiqueApp> {
  int _selectedIndex = 0;

  static const _pages = <Widget>[PerfumeCategoryPage(), PerfumeDetailPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (value) => setState(() => _selectedIndex = value),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white.withOpacity(0.95),
            selectedItemColor: const Color(0xFF8B5E57),
            unselectedItemColor: const Color(0xFFB89A96),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Basket',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PerfumeCategoryPage extends StatelessWidget {
  const PerfumeCategoryPage({super.key});

  static final List<PerfumeData> perfumes = [
    PerfumeData(
      title: 'GUERLAIN DIAMOND',
      subtitle: 'DIAMONDS SHE 100ML',
      price: '£70.00',
      backgroundColor: const Color(0xFFC9A69E),
      imageUrl:
          'https://images.unsplash.com/photo-1541643600914-e0fdc6e6f8d0?w=400',
    ),
    PerfumeData(
      title: 'SHALIMAR INITAL',
      subtitle: 'SHALIMAR SHE 100ML',
      price: '£60.00',
      backgroundColor: Colors.white,
      isDarkText: true,
      imageUrl:
          'https://images.unsplash.com/photo-1588405748903-c2b3dd1ef5aa?w=400',
    ),
    PerfumeData(
      title: 'AQUA UNIVERSALIS',
      subtitle: 'UNIVERSAL SHE 75ML',
      price: '£75.00',
      backgroundColor: const Color(0xFFB8A89E),
      imageUrl:
          'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=400',
    ),
    PerfumeData(
      title: 'POISON FOREVER',
      subtitle: 'POISON EDITION 100ML',
      price: '£85.00',
      backgroundColor: const Color(0xFFD4A5A0),
      imageUrl:
          'https://images.unsplash.com/photo-1523293182086-7651a899d37f?w=400',
    ),
    PerfumeData(
      title: 'ANGE CHARME',
      subtitle: 'ANGE SHE 80ML',
      price: '£65.00',
      backgroundColor: Colors.white,
      isDarkText: true,
      imageUrl:
          'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF8F1EE), Color(0xFFF2E2DB)],
              ),
            ),
          ),
        ),
        Positioned(
          top: 42,
          right: -80,
          child: _SoftGlow(size: 220, color: const Color(0xFFF0DCD6)),
        ),
        Positioned(
          bottom: -120,
          left: -100,
          child: _SoftGlow(size: 260, color: const Color(0xFFE3C1B7)),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.menu_rounded,
                color: Color(0xFF8B5E57),
                size: 30,
              ),
              const SizedBox(height: 26),
              const Text(
                'Featured',
                style: TextStyle(
                  color: Color(0xFFB69A96),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Categories',
                style: TextStyle(
                  color: Color(0xFF6F3642),
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  height: 1.05,
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 42,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _CategoryChip(label: 'ALL', selected: false),
                    _CategoryChip(label: 'J\'ADORE', selected: true),
                    _CategoryChip(label: 'MISS DIOR', selected: false),
                    _CategoryChip(label: 'POISON', selected: false),
                    _CategoryChip(label: 'ANGE', selected: false),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: screenHeight * 0.42,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: perfumes.length,
                  itemBuilder: (context, index) {
                    final perfume = perfumes[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index < perfumes.length - 1 ? 16 : 0,
                      ),
                      child: SizedBox(
                        width: 180,
                        child: ReusablePerfumeCard(
                          title: perfume.title,
                          subtitle: perfume.subtitle,
                          price: perfume.price,
                          backgroundColor: perfume.backgroundColor,
                          imageUrl: perfume.imageUrl,
                          isDarkText: perfume.isDarkText,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Tapped: ${perfume.title}'),
                                duration: const Duration(milliseconds: 800),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 108,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: perfumes.length,
                  itemBuilder: (context, index) {
                    final perfume = perfumes[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index < perfumes.length - 1 ? 16 : 0,
                      ),
                      child: SizedBox(
                        width: 140,
                        child: _SmallCard(title: perfume.title),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: selected ? const Color(0xFF8B5E57) : Colors.transparent,
          width: 1.2,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? const Color(0xFF8B5E57) : const Color(0xFFB89A96),
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _SmallCard extends StatelessWidget {
  const _SmallCard({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.65),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF6F3642),
          fontSize: 14,
          fontWeight: FontWeight.w800,
          height: 1.1,
        ),
      ),
    );
  }
}

class _SoftGlow extends StatelessWidget {
  const _SoftGlow({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withOpacity(0.6), color.withOpacity(0.0)],
        ),
      ),
    );
  }
}
