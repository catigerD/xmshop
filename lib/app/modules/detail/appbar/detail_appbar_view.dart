import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/detail/appbar/detail_appbar_controller.dart';

class DetailAppbarView extends GetView<DetailAppbarController>
    implements PreferredSizeWidget {
  const DetailAppbarView({super.key});

  static const _height = 40.0;

  static const _iconBtnBgColor = Color(0xffb2b2b2);
  static const _selectedTabColor = Color(0xfff16139);

  @override
  Size get preferredSize => const Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: _iconBtn(
                iconData: Icons.arrow_back_ios_new,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(() {
              final uiState = controller.uiState.value;
              final double opacity;
              if (uiState is DetailAppbarFullState) {
                opacity = uiState.tabOpacity;
              } else {
                opacity = 1;
              }
              return Opacity(
                opacity: opacity,
                child: Container(
                  margin: const EdgeInsets.only(left: 12, right: 12),
                  child: Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: controller.tabList
                          .map((e) => _tabItem(
                              context, e, uiState is DetailAppbarTabState))
                          .toList(),
                    );
                  }),
                ),
              );
            }),
          ),
          Container(
            child: Row(
              children: [
                _iconBtn(iconData: Icons.share_outlined),
                const SizedBox(
                  width: 12,
                ),
                _iconBtn(iconData: Icons.menu)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _iconBtn({required IconData iconData}) {
    return SizedBox(
      width: 28,
      height: 28,
      child: Obx(() {
        final isFullState = controller.uiState.value is DetailAppbarFullState;
        return ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
                padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                backgroundColor: WidgetStateProperty.all(
                    isFullState ? _iconBtnBgColor : Colors.transparent),
                shape: WidgetStateProperty.all(const CircleBorder())),
            child: Icon(
              iconData,
              size: 16,
              color: isFullState ? Colors.white : Colors.black,
            ));
      }),
    );
  }

  Widget _tabItem(
      BuildContext context, DetailAppbarTabItemVO vo, bool canClick) {
    final textStyle = Theme.of(context).textTheme.titleMedium;
    return IgnorePointer(
      ignoring: !canClick,
      child: InkWell(
        onTap: () {
          controller.changeTab(vo);
        },
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  vo.title,
                  style: vo.selected
                      ? textStyle?.copyWith(color: _selectedTabColor)
                      : textStyle,
                ),
                const SizedBox(
                  height: 4,
                ),
                Visibility(
                  visible: vo.selected,
                  child: Container(
                    height: 2,
                    color: _selectedTabColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
