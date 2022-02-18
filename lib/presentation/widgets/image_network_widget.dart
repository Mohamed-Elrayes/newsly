import 'package:flutter/material.dart';
import 'widgets.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget({
    Key? key,
    required this.imageUrl,
    this.boxFit,
    this.clipImage = true,
  }) : super(key: key);
  final String imageUrl;
  final BoxFit? boxFit;
  final bool clipImage;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: boxFit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
          !clipImage
              ? child
              : Card(
                  child: child,
                  clipBehavior: Clip.antiAlias,
                ),
      loadingBuilder: (context, child, loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()],
          );
        } else {
          return child;
        }
      },
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
    );
  }
}
