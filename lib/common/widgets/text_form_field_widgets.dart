import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget searchBar({
  final TextEditingController? controller,
  final String? hintText,
  final void Function(String)? onChanged,
}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
  );
}
