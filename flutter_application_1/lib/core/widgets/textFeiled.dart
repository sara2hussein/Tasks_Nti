import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({super.key, required this.controller, required this.hintText,
   required this.perfexIcon,  this.ispassword =false, this.validator, this.obscureText =false,  this.visibility});
final TextEditingController controller;
final String hintText;
final IconData perfexIcon;
final bool ispassword;
final String?Function(String?)? validator;
final bool obscureText;
final VoidCallback? visibility;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: ispassword? obscureText:false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(perfexIcon,color:Colors.deepOrange),
        suffixIcon: ispassword ? IconButton(
           icon: Icon(obscureText? Icons.visibility:Icons.visibility_off, color: Colors.deepOrange,),
          onPressed: visibility,): null,
          contentPadding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
         border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
     enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.deepOrange)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.deepOrange)
    ) 
      ),
    );
  }
}