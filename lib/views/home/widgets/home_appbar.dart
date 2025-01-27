import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final bool? centerTitle;

  const HomeAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: Color(0xFFEFEFEF),
      title: title,
      actions: actions,
      centerTitle: centerTitle ?? false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
