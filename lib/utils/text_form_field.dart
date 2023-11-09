import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  String fieldName;
  String hintText;
  TextInputType keyboardType;
  TextEditingController controller;
  String? Function(String?) validator;
  bool isobscure;
  Widget? suffixIcon;

  TextFormWidget({
    required this.fieldName,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.validator,
    this.suffixIcon,
    this.isobscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 20),
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: MyTheme.whiteColor,
              filled: true,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.grey
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            obscureText: isobscure,
          ),
        ),
      ],
    );
  }
}
