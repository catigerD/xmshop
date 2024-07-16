import 'package:flutter/material.dart';

class AsyncLoadingView extends StatelessWidget {
  const AsyncLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
