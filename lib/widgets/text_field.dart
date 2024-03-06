import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({required this.label, required this.controller,this.isPassword,this.maxLines,this.isNumber,this.isAutoValidate, this.isMultiline, this.isEmail, super.key});

  final String label;
  final TextEditingController controller;
  final bool? isPassword;
  final int? maxLines;
  final bool? isNumber;
  final bool? isAutoValidate;
  final bool? isMultiline;
  final bool? isEmail;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: isAutoValidate==false?AutovalidateMode.disabled:AutovalidateMode.onUserInteraction,
      validator: (value){
        if(isEmail==true){
          bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!);
          if (emailValid != true) {
            return 'Email Format not matched';
          }
        }
        if(value == null||value.isEmpty){
          return 'This Field Cant be Empty';
        }
        return null;
      },
      controller: controller,
      maxLines: maxLines??1,
      keyboardType: isNumber==true?TextInputType.number:isMultiline==true?TextInputType.multiline:TextInputType.text,
      inputFormatters: isNumber==true?[
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
      ]:[],
      decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      obscureText: isPassword??false,
    );
  }
}
