import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/constants/app_colors.dart';

// ignore: must_be_immutable
class CommonTxtField extends StatefulWidget {
  String labelText;
  String hintText;
  FormFieldValidator<String>? validator;
  TextEditingController controller;
  final bool isPassword;

  CommonTxtField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.validator,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<CommonTxtField> createState() => _CommonTxtFieldState();
}

class _CommonTxtFieldState extends State<CommonTxtField> {
    bool obscureText = true;
 @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.isPassword ? obscureText : false,
        keyboardType:
            widget.isPassword == true
                ? TextInputType.visiblePassword
                : TextInputType.text,

       
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
                    filled: true,

          fillColor: AppColors.txtFieldBc,
         suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off_outlined : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
             : null,
              enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:  BorderSide(color:AppColors.txtFieldBc, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: AppColors.txtFieldBc),
          ),
        ),
      
    );
  }
}
