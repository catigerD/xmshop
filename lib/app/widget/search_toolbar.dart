import 'package:flutter/material.dart';

class SearchToolbar extends StatelessWidget {
  static final Color _bgColor = Color(int.parse("0xfff6f6f6"));
  static final Color _hintColor = Color(int.parse("0xffafafaf"));

  final String title;

  const SearchToolbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 6, right: 6),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: _hintColor,
            size: 16,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: _hintColor),
          )
        ],
      ),
    );
  }
}
