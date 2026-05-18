import 'package:flutter/material.dart';
import 'package:perfumeshopping/models/model.dart';
import 'package:perfumeshopping/widget/reusablecard.dart';
import 'package:perfumeshopping/screens/DetailScreen.dart';

class PerfumeBoutiqueApp extends StatefulWidget {
  const PerfumeBoutiqueApp({super.key});

  @override
  State<PerfumeBoutiqueApp> createState() => _PerfumeBoutiqueAppState();
}

class _PerfumeBoutiqueAppState extends State<PerfumeBoutiqueApp> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  late final List<Widget> _pages = [
    PerfumeCategoryPage(controller: _searchController),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
        child: Container(
          height: 66,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.98),
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6EDEB),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Color(0xFFB89A96)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          onChanged: (v) {
                            // The controller is listened to by PerfumeCategoryPage
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _selectedIndex = 1),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x11000000),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Color(0xFF8B5E57),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Profile tapped'),
                            duration: Duration(milliseconds: 700),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x11000000),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person_outline,
                          color: Color(0xFF8B5E57),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PerfumeCategoryPage extends StatefulWidget {
  const PerfumeCategoryPage({super.key, this.controller});

  final TextEditingController? controller;

  static final List<PerfumeData> perfumes = [
    PerfumeData(
      title: 'GUERLAIN DIAMOND',
      subtitle: 'DIAMONDS SHE 100ML',
      price: '£70.00',
      backgroundColor: const Color(0xFFC9A69E),
      category: 'J\'ADORE',
      imageUrl:
          'https://images.unsplash.com/photo-1541643600914-e0fdc6e6f8d0?w=400',
      images: [
        'https://images.unsplash.com/photo-1541643600914-e0fdc6e6f8d0?w=800',
        'https://images.unsplash.com/photo-1588405748903-c2b3dd1ef5aa?w=800',
        'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=800',
      ],
      description:
          'A delicate floral-oriental perfume with warm vanilla and soft floral heart notes. Elegant and timeless.',
    ),
    PerfumeData(
      title: 'SHALIMAR INITAL',
      subtitle: 'SHALIMAR SHE 100ML',
      price: '£60.00',
      backgroundColor: Colors.white,
      category: 'MISS DIOR',
      isDarkText: true,
      imageUrl:
          'https://images.unsplash.com/photo-1588405748903-c2b3dd1ef5aa?w=400',
      images: [
        'https://images.unsplash.com/photo-1588405748903-c2b3dd1ef5aa?w=800',
        'https://images.unsplash.com/photo-1541643600914-e0fdc6e6f8d0?w=800',
        'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=800',
      ],
      description:
          'An intimate and sensual fragrance with a blend of soft florals and amber notes — modern and refined.',
    ),
    PerfumeData(
      title: 'AQUA UNIVERSALIS',
      subtitle: 'UNIVERSAL SHE 75ML',
      price: '£75.00',
      backgroundColor: const Color(0xFFB8A89E),
      category: 'J\'ADORE',
      imageUrl:
          'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=400',
      images: [
        'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=800',
        'https://images.unsplash.com/photo-1523293182086-7651a899d37f?w=800',
        'https://images.unsplash.com/photo-1541643600914-e0fdc6e6f8d0?w=800',
      ],
      description:
          'Fresh and luminous, combining citrus top notes with a soft musky base for everyday elegance.',
    ),
    PerfumeData(
      title: 'POISON FOREVER',
      subtitle: 'POISON EDITION 100ML',
      price: '£85.00',
      backgroundColor: const Color(0xFFD4A5A0),
      category: 'POISON',
      imageUrl:
          'https://images.unsplash.com/photo-1523293182086-7651a899d37f?w=400',
      images: [
        'https://images.unsplash.com/photo-1523293182086-7651a899d37f?w=800',
        'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=800',
        'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=800',
      ],
      description:
          'A bold and mysterious composition with deep fruity top notes and a rich woody base.',
    ),
    PerfumeData(
      title: 'ANGE CHARME',
      subtitle: 'ANGE SHE 80ML',
      price: '£65.00',
      backgroundColor: Colors.white,
      category: 'ANGE',
      isDarkText: true,
      imageUrl:
          'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=400',
      images: [
        'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=800',
        'https://images.unsplash.com/photo-1541643600914-e0fdc6e6f8d0?w=800',
        'https://images.unsplash.com/photo-1588405748903-c2b3dd1ef5aa?w=800',
      ],
      description:
          'Soft and charming with a delicate floral bouquet lifted by sweet fruit accords.',
    ),
  ];

  @override
  State<PerfumeCategoryPage> createState() => _PerfumeCategoryPageState();
}

class _PerfumeCategoryPageState extends State<PerfumeCategoryPage> {
  List<PerfumeData> _displayed = PerfumeCategoryPage.perfumes;
  String _selectedCategory = 'ALL';

  @override
  void initState() {
    super.initState();
    _displayed = PerfumeCategoryPage.perfumes;
    widget.controller?.addListener(_handleSearch);
  }

  void _handleSearch() {
    _applyFilters();
  }

  void _applyFilters() {
    final q = widget.controller?.text.toLowerCase().trim() ?? '';
    setState(() {
      var list = PerfumeCategoryPage.perfumes;
      if (_selectedCategory != 'ALL') {
        list = list
            .where(
              (p) =>
                  p.category.toUpperCase() == _selectedCategory.toUpperCase(),
            )
            .toList();
      }
      if (q.isNotEmpty) {
        list = list.where((p) => p.title.toLowerCase().contains(q)).toList();
      }
      _displayed = list;
    });
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleSearch);
    super.dispose();
  }

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
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Categories',
                style: TextStyle(
                  color: Color(0xFF6F3642),
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  height: 1.05,
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 42,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (final label in [
                      'ALL',
                      'J\'ADORE',
                      'MISS DIOR',
                      'POISON',
                      'ANGE',
                    ])
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: _CategoryChip(
                          label: label,
                          selected: _selectedCategory == label,
                          onTap: () {
                            setState(() {
                              _selectedCategory = label;
                              _applyFilters();
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: screenHeight * 0.42,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _displayed.length,
                  itemBuilder: (context, index) {
                    final perfume = _displayed[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index < _displayed.length - 1 ? 16 : 0,
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DetailScreen(perfume: perfume),
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
                  itemCount: _displayed.length,
                  itemBuilder: (context, index) {
                    final perfume = _displayed[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index < _displayed.length - 1 ? 16 : 0,
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

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.selected,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
