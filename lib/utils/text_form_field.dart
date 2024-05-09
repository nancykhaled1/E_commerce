import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  //String fieldName;
  String hintText;
  TextInputType keyboardType;
  TextEditingController controller;
  String? Function(String?) validator;
  bool isobscure;
  Widget? suffixIcon;
  void Function()? suffixIconFunction;

  TextFormWidget({
    //required this.fieldName,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.validator,
    this.suffixIcon,
    this.isobscure = false,
     this.suffixIconFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Padding(
          padding: const EdgeInsets.only(bottom: 20,left: 40, right: 40),
          child: Container(
            alignment: Alignment.center,
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                fillColor: MyTheme.whiteColor,
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(

                  color: Colors.grey,
                  fontSize: 15
                ),
                suffix: suffixIcon,
                // suffixIcon: InkWell(
                //     onTap: suffixIconFunction,
                //     child: Icon(Icons.visibility_off)
                // ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyTheme.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              keyboardType: keyboardType,
              controller: controller,
              validator: validator,
              obscureText: isobscure,
            ),
          ),
        ),
      ],
    );
  }
}
