import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({required this.label, required this.controller,this.isAutoValidate,required this.hintText, super.key});

  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool? isAutoValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        bool validURL = Uri.parse(value!).isAbsolute;
        if(value.isEmpty){
          return 'This Field Cant be Empty';
        }else if(!validURL){
          return 'Enter the valid URL';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
