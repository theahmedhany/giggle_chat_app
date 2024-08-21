import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  final Function(String)? onChanged;
  final String? hintText;
  final bool obscureText;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xff203590),
      style: const TextStyle(
        color: Color(0xff230462),
        fontSize: 20,
      ),
      obscureText: _obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return "Field is required.";
        }
        return null;
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xff230462), fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 3,
            color: Color(0xff6083C5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 3,
            color: Color(0xff230462),
          ),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xff203590),
                ),
                onPressed: _toggleObscureText,
              )
            : null,
      ),
    );
  }
}
