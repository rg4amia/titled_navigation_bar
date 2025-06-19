import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import 'navigation_bar_item.dart';

const double DEFAULT_BAR_HEIGHT = 60;

const double DEFAULT_INDICATOR_HEIGHT = 2;

// ignore: must_be_immutable
class TitledBottomNavigationBar extends StatefulWidget {
  final bool reverse;
  final Curve curve;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? inactiveStripColor;
  final Color? indicatorColor;
  final bool enableShadow;
  final int currentIndex;

  /// Called when an item is tapped.
  ///
  /// Provides the selected item's index.
  final ValueChanged<int> onTap;

  /// The items of this navigation bar.
  ///
  /// This should contain at least two items and five at most.
  final List<TitledNavigationBarItem> items;

  /// The selected item's indicator height.
  ///
  /// Defaults to [DEFAULT_INDICATOR_HEIGHT].
  final double indicatorHeight;

  /// Change the navigation bar's size.
  ///
  /// Defaults to [DEFAULT_BAR_HEIGHT].
  final double height;

  const TitledBottomNavigationBar({
    Key? key,
    this.reverse = false,
    this.curve = Curves.linear,
    required this.onTap,
    required this.items,
    this.activeColor,
    this.inactiveColor,
    this.inactiveStripColor,
    this.indicatorColor,
    this.enableShadow = true,
    this.currentIndex = 0,
    this.height = DEFAULT_BAR_HEIGHT,
    this.indicatorHeight = DEFAULT_INDICATOR_HEIGHT,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  State createState() => _TitledBottomNavigationBarState();
}

class _TitledBottomNavigationBarState extends State<TitledBottomNavigationBar> {
  late int _selectedIndex;

  bool get reverse => widget.reverse;
  Curve get curve => widget.curve;
  List<TitledNavigationBarItem> get items => widget.items;

  double width = 0;
  final Duration duration = const Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  @override
  void didUpdateWidget(covariant TitledBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex) {
      _selectedIndex = widget.currentIndex;
    }
  }

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (items.length - 1))!;
    } else {
      return lerpDouble(1.0, -1.0, index / (items.length - 1))!;
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    final Color activeColor =
        widget.activeColor ?? Theme.of(context).colorScheme.primary;

    return Container(
      height: widget.height + MediaQuery.of(context).viewPadding.bottom,
      width: width,
      decoration: BoxDecoration(
        color: widget.inactiveStripColor ?? Theme.of(context).cardColor,
        boxShadow: widget.enableShadow
            ? const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ]
            : null,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: widget.indicatorHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return GestureDetector(
                  onTap: () => _select(index),
                  child: _buildItemWidget(
                      item, index == _selectedIndex, activeColor),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 0,
            width: width,
            child: AnimatedAlign(
              alignment: Alignment(_getIndicatorPosition(_selectedIndex), 0),
              curve: curve,
              duration: duration,
              child: Container(
                color: widget.indicatorColor ?? activeColor,
                width: width / items.length,
                height: widget.indicatorHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _select(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap(_selectedIndex);
  }

  Widget _buildIcon(TitledNavigationBarItem item, Color activeColor) {
    return IconTheme(
      data: IconThemeData(
        color: reverse ? widget.inactiveColor : activeColor,
      ),
      child: item.leading,
    );
  }

  Widget _buildText(TitledNavigationBarItem item, Color activeColor) {
    return DefaultTextStyle.merge(
      child: item.title,
      style: TextStyle(color: reverse ? activeColor : widget.inactiveColor),
    );
  }

  Widget _buildItemWidget(
      TitledNavigationBarItem item, bool isSelected, Color activeColor) {
    return Container(
      color: item.backgroundColor,
      height: widget.height,
      width: width / items.length,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          AnimatedOpacity(
            opacity: isSelected ? 0.0 : 1.0,
            duration: duration,
            curve: curve,
            child: reverse
                ? _buildIcon(item, activeColor)
                : _buildText(item, activeColor),
          ),
          AnimatedAlign(
            duration: duration,
            alignment: isSelected ? Alignment.center : const Alignment(0, 5.2),
            child: reverse
                ? _buildText(item, activeColor)
                : _buildIcon(item, activeColor),
          ),
        ],
      ),
    );
  }
}
