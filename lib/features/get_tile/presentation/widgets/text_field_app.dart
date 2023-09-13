import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yandex_map_parking_layer_test/res/assets/colors.gen.dart';
import 'package:yandex_map_parking_layer_test/theme/app_typography.dart';

class FieldApp extends StatelessWidget {
  const FieldApp({
    Key? key,
    this.validator,
    this.labelText = '',
    required this.controller,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: ColorName.black,
      controller: controller,
      style: AppTypography.santelloRegular17.copyWith(color: ColorName.black),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        label: Text(
          labelText,
          style: AppTypography.santelloRegular17
              .copyWith(color: ColorName.black),
        ),
        labelStyle:
            AppTypography.santelloRegular17.copyWith(color: ColorName.black),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorName.red, width: 2),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorName.active, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorName.active, width: 2),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorName.active, width: 2),
        ),
      ),
      validator: validator,
    );
  }
}

RegExp latValidate = RegExp(
    r'^(\+|-)?(?:90(?:(?:\.0{1,6})?)|(?:[0-9]|[1-8][0-9])(?:(?:\.[0-9]{1,6})?))$');
RegExp lonValidate = RegExp(
    r'^(\+|-)?(?:180(?:(?:\.0{1,6})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:\.[0-9]{1,6})?))$');
