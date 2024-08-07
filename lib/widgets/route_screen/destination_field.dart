import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomDestinationField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Function()? onTap;
  final Function(String)? onChanged;
  const CustomDestinationField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              prefixIcon: Icon(
                icon,
                color: AppColors.iconColor,
              ),
              suffixIcon: InkWell(
                onTap: onTap,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Map',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 3),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: AppColors.borderColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
