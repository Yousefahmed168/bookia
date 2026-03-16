import 'package:flutter/material.dart';

class ListViewShimmer extends StatelessWidget {
  const ListViewShimmer({
    super.key,
    this.itemCount = 6,
    this.scrollDirection = Axis.vertical,
    required this.child,
  });

  final int itemCount;
  final Axis scrollDirection;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      scrollDirection: scrollDirection,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 10, width: 10),
      itemBuilder: (context, index) {
        return child;
      },
    );
  }
}
