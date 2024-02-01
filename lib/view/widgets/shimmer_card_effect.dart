import 'package:flutter/material.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardEffect extends StatelessWidget {
  final double height;
  final double width;
  final int items;
  const ShimmerCardEffect(
      {super.key,
      required this.items,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: items,
            itemBuilder: (((context, index) {
              return Container(
                height: height,
                width: width,
                margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }))));
  }
}
