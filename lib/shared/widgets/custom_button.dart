import 'package:flutter/material.dart';
import 'package:panda_test/shared/colors/colors.dart';

enum CustomButtonType { filled, bordered }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final CustomButtonType type;
  final bool isExpanded;
  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = CustomButtonType.filled,
    this.isExpanded = true,
    this.height,
    this.width,
  });

  static const Color baseColor = Color(0xFF4D4D4D);

  @override
  Widget build(BuildContext context) {
    final bool isBordered = type == CustomButtonType.bordered;

    final button = SizedBox(
      height: height ?? 48,
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isBordered ? Colors.transparent : baseColor,
          side: isBordered ? const BorderSide(color: baseColor) : BorderSide.none,
          foregroundColor: baseColor,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: isBordered
              ? Theme.of(context).textTheme.bodySmall?.copyWith(color: baseColor)
              : Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.white),
        ),
      ),
    );

    return isExpanded ? Expanded(child: button) : button;
  }
}
