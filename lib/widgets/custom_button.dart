import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, required this.buttonTitle});

  VoidCallback? onTap;
  String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff6083C5),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 60,
        width: double.infinity,
        child: Center(
            child: Text(
          buttonTitle,
          style: const TextStyle(fontSize: 25, color: Color(0xffE6E5E0)),
        )),
      ),
    );
  }
}
