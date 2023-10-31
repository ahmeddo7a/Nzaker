import 'package:flutter/material.dart';
import 'package:nzaker/core/components/resources/color_manager.dart';

import '../../components/resources/string_manager.dart';
import '../../components/widgets/app_bar.dart';

class BasicErrorScreen extends StatelessWidget {
  const BasicErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          context: context, appBarTitle: AppStrings.appTitle),
      body: Center(
        child: Text(AppStrings.defaultErrorMessage,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.cautionColor),),
      ),
    );
  }
}
