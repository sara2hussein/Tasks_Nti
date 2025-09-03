import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.text, required this.onpres,   this.isLoading=false});
final String text;
final VoidCallback onpres;
final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: isLoading? const Center(
        child: CircularProgressIndicator()): 
        ElevatedButton(
          onPressed: onpres,
         child: Text(text,style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        
         ))
    );
  }
}