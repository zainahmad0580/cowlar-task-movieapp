import 'package:flutter/material.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

//Reuseable shimmer card effect
class ShimmerCardEffect extends StatelessWidget {
  final double height;
  final double width;
  final int items;
  //Can be used as listview or gridview
  final bool isList;
  const ShimmerCardEffect(
      {super.key,
      required this.items,
      required this.height,
      required this.width,
      this.isList = true});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: isList
            ? ListView.builder(
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
                })))
            : GridView.builder(
                itemCount: items,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: size.width * 0.03,
                    mainAxisSpacing: size.height * 0.02,
                    childAspectRatio: size.width / size.width * 1.5),
                itemBuilder: ((context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.03),
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                })));
  }
}
