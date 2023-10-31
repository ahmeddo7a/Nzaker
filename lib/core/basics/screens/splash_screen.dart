import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nzaker/core/components/resources/assets_manager.dart';

import '../../components/resources/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),()=> Navigator.pushReplacementNamed(context, Routes.homeRoute));
  }

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: myWidth*0.3),
          child: SvgPicture.asset(ImageAssetsManager.mainLogo,),
        ),
      ),
    );
  }
}
