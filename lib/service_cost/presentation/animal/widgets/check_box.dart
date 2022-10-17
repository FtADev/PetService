import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final String title;
  final Color containerColor;
  final Color containerBorderColor;
  final bool isSelected;
  final GestureTapCallback? onChange;

  const CheckBox(
      {Key? key,
      required this.title,
      required this.containerColor,
      required this.containerBorderColor,
      required this.onChange,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: onChange,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: !isSelected ? const Color(0xFFf5f5f5) : containerColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                color: isSelected ? containerBorderColor : const Color(0xFFf5f5f5),
              ),
            ),
            child: Icon(
              Icons.check,
              size: 20,
              color: !isSelected ? const Color(0xFFf5f5f5) : Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}