import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AsyncEmptyView extends StatelessWidget {
  const AsyncEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "无数据",
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
