import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../logo_image_assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // color: Colors.amber,
      child: const LogoImageAssets(
        imageUrlLight: 'assets/logo_login.png',
        imageUrlDark: 'assets/logo_login_light.png',
      ),
    );
  }
}
