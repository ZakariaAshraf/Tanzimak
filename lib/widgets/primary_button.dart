import 'package:flutter/material.dart';
import 'package:tanzimak/core/config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function()? onTap;
  const PrimaryButton({super.key, required this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme =Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 327,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? AppColors.primary,
        ),
        child:Center(
          child: Text(
            title,
            style:theme.bodyMedium!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
