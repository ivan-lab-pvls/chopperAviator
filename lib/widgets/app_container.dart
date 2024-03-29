import 'package:chopper_crew_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;

  const AppContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.black5,
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: child,
    );
  }
}