import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 228,
      child: Image.network(
        "https://www.itying.com/images/focus/focus02.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
