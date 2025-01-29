import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Color? backgroundColor;

  const CustomAppbar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: backgroundColor ?? Color(0xFFFFFFFF),
      title: title,
      actions: actions,
      centerTitle: centerTitle ?? false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
