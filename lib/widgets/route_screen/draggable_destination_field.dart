import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class DraggableDestinationField extends StatelessWidget {
  final bool isFirst;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function()? onDrag;
  final Function()? onRemove;
  const DraggableDestinationField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.onTap,
    this.onChanged,
    this.onDrag,
    this.onRemove,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 340.rw,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.iconColor.withOpacity(0.2),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 290.rw,
                height: 60,
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
                    fillColor: AppColors.whiteColor,
                    filled: true,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
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
              IconButton(
                icon: const Icon(Icons.drag_indicator_rounded),
                color: AppColors.iconColor,
                onPressed: onDrag,
              ),
            ],
          ),
        ),
        // const SizedBox(width: 10),
        if (!isFirst)
          IconButton(
            icon: const Icon(Icons.close),
            color: AppColors.iconColor,
            iconSize: 30,
            onPressed: onRemove,
          ),
      ],
    );
  }
}
