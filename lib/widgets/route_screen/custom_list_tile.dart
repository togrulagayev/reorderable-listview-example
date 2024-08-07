import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function()? onTap;
  final IconData icon;
  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.iconColor),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
    );
  }
}
