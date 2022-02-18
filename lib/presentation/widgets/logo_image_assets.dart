import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


import '../../logic/cubit/theme/theme_cubit.dart';
import 'custom_text_widget.dart';

class LogoImageAssets extends StatelessWidget {
  const LogoImageAssets({
    Key? key,
    required this.imageUrlLight,
    required this.imageUrlDark,
  }) : super(key: key);
  final String imageUrlLight;
  final String imageUrlDark;

  @override
  Widget build(BuildContext context) {
    final themeCubitState = context.read<ThemeCubit>();
    return themeCubitState.state.themeMode == ThemeMode.light
        ? _AssetsImageWidget(
            imageUrl: imageUrlLight,
          )
        : _AssetsImageWidget(
            imageUrl: imageUrlDark,
          );
  }
}

class _AssetsImageWidget extends HookWidget {
  final ValueNotifier<bool> _visible = ValueNotifier<bool>(false);
  _AssetsImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    _visible.value = true;
    return ValueListenableBuilder(
        valueListenable: _visible,
        builder: (context, isVisible, _) {
          return AnimatedOpacity(
            opacity: _visible.value ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              imageUrl,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
                  child,
              errorBuilder: (context, error, stackTrace) => Card(
                color: Colors.white70,
                margin: EdgeInsets.zero,
                child: SizedBox.expand(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error,
                      size: 25,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextWidget.subTitle('Oops! image is damage'),
                  ],
                )),
              ),
            ),
          );
        });
  }
}
