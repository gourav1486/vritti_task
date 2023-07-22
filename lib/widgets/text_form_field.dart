import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextFormField extends StatelessWidget {
  String hintText;
  String labelText;
  TextEditingController controller;
  CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color:Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: GoogleFonts.poppins(color: Colors.black),
          hintStyle: GoogleFonts.poppins(fontSize: 14),
        ),
        validator: (value) {
          if (value!.isEmpty || value == null) {
            return 'Enter Some Value ';
          }
        },
      ),
    );
  }
}
