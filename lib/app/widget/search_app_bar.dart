import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const Color _bgColor = Color(0xfff6f6f6);
  static const Color _hintColor = Color(0xffafafaf);

  static const double height = 40;
  static const double _searchHeight = 28;

  static const double _searchIconSize = 18;
  static const double _searchIconPadding = 4;
  static const double _searchRadius = _searchHeight / 2;

  final Widget Function(BuildContext context)? leadBuilder;
  final Widget Function(BuildContext context)? tailBuilder;
  final bool enable;
  final bool autofocus;
  final String? hintText;
  final TextEditingController? controller;

  @override
  Size get preferredSize => const Size.fromHeight(height);

  const SearchAppBar({
    super.key,
    this.leadBuilder,
    this.tailBuilder,
    this.enable = false,
    this.autofocus = false,
    this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      height: 40,
      child: Row(
        children: [
          leadBuilder?.call(context) ??
              const SizedBox(
                width: 0,
              ),
          Expanded(flex: 1, child: _search(context)),
          tailBuilder?.call(context) ??
              const SizedBox(
                width: 0,
              )
        ],
      ),
    );
  }

  Widget _search(BuildContext context) {
    return SizedBox(
      height: _searchHeight,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          TextField(
            autofocus: autofocus,
            enabled: enable,
            style: Theme.of(context).textTheme.labelMedium,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: _bgColor,
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: _hintColor),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(_searchRadius),
              ),
              contentPadding: const EdgeInsets.only(
                  left: _searchRadius + _searchIconSize + _searchIconPadding,
                  right: _searchRadius),
            ),
            maxLines: 1,
          ),
          const Positioned(
            left: _searchRadius,
            child: Icon(
              Icons.search,
              size: _searchIconSize,
            ),
          ),
        ],
      ),
    );
  }
}
