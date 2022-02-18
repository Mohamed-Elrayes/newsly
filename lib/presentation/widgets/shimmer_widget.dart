import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'articles_list_widget.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: ArticlesListView(
        itemCount: 10,
        childBuilderAnimated: (context, index) {
          return const _ShimmerItemWidget();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 50,
        ),
      ),
    );
  }
}

class _ShimmerItemWidget extends StatelessWidget {
  const _ShimmerItemWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[300]!,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey,
              width: mediaQuery.width * 0.4 - 5 - 16,
              height: 147,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              // color: Colors.red,
              height: 147,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 9,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 29,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 29,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
