import 'package:flutter/material.dart';
import 'package:movieapp/utils/styles.dart';

import '../../utils/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool isLoading;
  final TextStyle textStyle;
  final Color btnColor;
  final double width;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.isLoading = false,
    this.textStyle = ThemeText.btnText,
    this.btnColor = AppColors.btn,
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
              borderRadius: BorderRadius.circular(10.0), color: btnColor),
          child: Center(
              child: isLoading
                  ? const CircularProgressIndicator(
                      strokeWidth: 3.0,
                      color: AppColors.bg,
                    )
                  : Text(title, style: textStyle)),
        ));
  }
}
