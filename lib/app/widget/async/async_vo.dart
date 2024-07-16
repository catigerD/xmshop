import 'package:xmshop/app/widget/async/async_view.dart';

sealed class AsyncVO {}

class AsyncEmptyVO extends AsyncVO {}

class AsyncLoadingVO extends AsyncVO {}

class AsyncContentVO<Content> extends AsyncVO {
  final Content content;

  AsyncContentVO({
    required this.content,
  });
}

extension AsyncVOExt on AsyncVO {
  AsyncState get state {
    return this is AsyncLoadingVO
        ? AsyncState.loading
        : (this is AsyncEmptyVO ? AsyncState.empty : AsyncState.content);
  }
}
