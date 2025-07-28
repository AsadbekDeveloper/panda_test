import 'package:flutter/material.dart';
import 'package:panda_test/shared/colors/colors.dart';

enum CustomButtonType { filled, bordered }
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
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
  static const Color disabledColor = Color(0xFFBFBFBF); // Light gray for disabled state

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;
    final bool isBordered = type == CustomButtonType.bordered;

    final Color backgroundColor = isBordered
        ? Colors.transparent
        : isEnabled
        ? baseColor
        : disabledColor;

    final Color borderColor = isEnabled ? baseColor : disabledColor;

    final Color textColor = isBordered ? (isEnabled ? baseColor : disabledColor) : AppColors.white;

    final button = SizedBox(
      height: height ?? 48,
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: isBordered ? BorderSide(color: borderColor) : BorderSide.none,
          foregroundColor: textColor,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: textColor),
        ),
      ),
    );

    return isExpanded ? Expanded(child: button) : button;
  }
}
