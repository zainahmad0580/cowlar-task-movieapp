import 'package:flutter/material.dart';
import 'package:movieapp/utils/styles.dart';

import '../../utils/app_colors.dart';

class OutlinedIconButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final TextStyle textStyle;
  final Color btnColor;
  final double width;
  final IconData iconData;

  const OutlinedIconButton({
    super.key,
    required this.title,
    required this.onPress,
    required this.iconData,
    this.textStyle = ThemeText.btnText,
    this.btnColor = Colors.transparent,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(size.width * 0.03),
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.btn),
              borderRadius: BorderRadius.circular(10.0),
              color: btnColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, color: AppColors.bg),
              SizedBox(width: size.width * 0.02),
              Text(title, style: textStyle),
            ],
          ),
        ));
  }
}
