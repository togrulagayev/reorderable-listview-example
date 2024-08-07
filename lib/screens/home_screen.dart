import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'generate_route_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        surfaceTintColor: AppColors.transparentColor,
        shadowColor: AppColors.shadowColor.withOpacity(.35),
        foregroundColor: AppColors.blackColor,
        title: const Text(
          'Demo App Bar',
          style: TextStyle(
            fontSize: 20,
            height: 1.5,
            fontWeight: FontWeight.w600,
            letterSpacing: .5,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Flexify.go(
              const GenerateRouteScreen(),
              animation: FlexifyRouteAnimations.slideAndFade,
              animationDuration: const Duration(milliseconds: 200),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            foregroundColor: AppColors.blackColor,
            elevation: 5,
            shadowColor: AppColors.shadowColor.withOpacity(.35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Go to next screen',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
            ),
          ),
        ),
      ),
    );
  }
}
