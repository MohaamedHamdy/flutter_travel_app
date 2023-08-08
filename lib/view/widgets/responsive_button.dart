// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  double? width;
  List<Widget> children;
  double? height;
  dynamic function;

  Button({
    Key? key,
    // this.function,
    this.width,
    required this.children,
    this.height,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0.h,
      width: width!.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 118, 61, 217),
        borderRadius: BorderRadius.circular(
          10.0.r,
        ),
      ),
      child: TextButton(
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
