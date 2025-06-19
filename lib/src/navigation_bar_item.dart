import 'package:flutter/material.dart';

/// A model representing an item in the [TitledBottomNavigationBar].
class TitledNavigationBarItem {
  /// The title of this item.
  final Widget title;

  /// The leading widget of this item (icon, SVG, image, etc).
  ///
  /// This can be an [Icon], an [SvgPicture] (from flutter_svg), or any widget.
  /// If this is not an [Icon] widget, you must handle the color manually.
  final Widget leading;

  /// The background color of this item.
  ///
  /// Defaults to [Colors.white].
  final Color backgroundColor;

  /// Creates a [TitledNavigationBarItem].
  ///
  /// [leading] and [title] are required. [backgroundColor] defaults to [Colors.white].
  const TitledNavigationBarItem({
    required this.leading,
    required this.title,
    this.backgroundColor = Colors.white,
  });
}
