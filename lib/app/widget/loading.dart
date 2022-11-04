import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: Lottie.asset("assets/lotties/loading.json")));
  }
}
