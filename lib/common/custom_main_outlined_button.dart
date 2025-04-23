import 'package:evently/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomMainOutlinedButton extends StatelessWidget {
  const CustomMainOutlinedButton(
      {super.key, this.onPressed, required this.title, this.icon});
  final void Function()? onPressed;
  final String title;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.mainColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) icon!,
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.mainColor),
              ),
            ],
          )),
    );
  }
}
