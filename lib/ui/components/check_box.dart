import 'package:flutter/material.dart';
import 'package:pet_service/ui/my_colors.dart';
import 'package:pet_service/ui/styles.dart';

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
                color: !isSelected ? grey_button : containerColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                border: Border.all(
                    color: isSelected ? containerBorderColor : grey_button,),),
            child: Icon(
              Icons.check,
              size: 20,
              color: !isSelected ? grey_button : white,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: checkboxStyle,
        ),
      ],
    );
  }
}