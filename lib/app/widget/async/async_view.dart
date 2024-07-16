import 'package:flutter/cupertino.dart';
import 'package:xmshop/app/widget/async/async_empty_view.dart';
import 'package:xmshop/app/widget/async/async_loading_view.dart';

class AsyncView extends StatelessWidget {
  final AsyncState state;
  final Widget Function(BuildContext context) contentBuilder;

  const AsyncView(
      {super.key, required this.state, required this.contentBuilder});

  @override
  Widget build(BuildContext context) {
    final Widget result;
    switch (state) {
      case AsyncState.loading:
        result = const AsyncLoadingView();
        break;
      case AsyncState.empty:
        result = const AsyncEmptyView();
        break;
      default:
        result = contentBuilder(context);
        break;
    }
    return result;
  }
}

enum AsyncState { loading, empty, content }
