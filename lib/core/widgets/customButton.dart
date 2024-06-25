import 'package:flutter/material.dart';
import 'package:myproject/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final Color? color;
  final Color? bgColor;
  final Color? borderColor;
  final double width;
  final double height;
  const CustomButton({
    super.key,
    required this.onPress,
    this.color,
    this.bgColor,
    this.borderColor,
    required this.title,
    required this.width ,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor ?? const Color(0xff203549),
          borderRadius: BorderRadius.circular(10),
          border: borderColor != null
              ? Border.all(color: borderColor!)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: color ?? Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),

          ],
        ),
      ),
    );
  }
}

