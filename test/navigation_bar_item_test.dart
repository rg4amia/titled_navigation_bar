import 'package:flutter_test/flutter_test.dart';
import 'package:titled_navigation_bar/src/navigation_bar_item.dart';
import 'package:flutter/material.dart';

void main() {
  group('TitledNavigationBarItem', () {
    test('should create item with correct properties', () {
      final item = TitledNavigationBarItem(
        title: const Text('Home'),
        leading: const Icon(Icons.home),
        backgroundColor: Colors.red,
      );
      expect(item.title, isA<Text>());
      expect(item.leading, isA<Icon>());
      expect(item.backgroundColor, Colors.red);
    });
  });
}
