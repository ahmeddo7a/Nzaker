import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../components/resources/color_manager.dart';

class BasicLoadingScreen extends StatelessWidget {
  const BasicLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LoadingAnimationWidget.inkDrop(color: ColorManager.mainColor, size: 40),),
    );
  }
}