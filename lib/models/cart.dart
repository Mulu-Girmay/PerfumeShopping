import 'package:flutter/foundation.dart';
import 'package:perfumeshopping/models/model.dart';

/// Simple app-wide cart using a ValueNotifier for minimal dependencies.
final ValueNotifier<List<PerfumeData>> cartNotifier =
    ValueNotifier<List<PerfumeData>>([]);

void addToCart(PerfumeData item) {
  final list = List<PerfumeData>.from(cartNotifier.value);
  list.add(item);
  cartNotifier.value = list;
}

void removeFromCart(PerfumeData item) {
  final list = List<PerfumeData>.from(cartNotifier.value);
  list.remove(item);
  cartNotifier.value = list;
}

void clearCart() {
  cartNotifier.value = [];
}
