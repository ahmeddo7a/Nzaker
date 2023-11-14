import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nzaker/core/basics/screens/basic_error_screen.dart';
import 'package:nzaker/core/basics/screens/basic_loading_screen.dart';
import 'package:nzaker/core/components/resources/string_manager.dart';
import 'package:nzaker/core/components/widgets/app_bar.dart';
import 'package:nzaker/features/results/presentation/logic/result/result_cubit.dart';

import '../../../../core/services/service_locator.dart';
import '../widgets/valid_result_widget.dart';

class ResultScreen extends StatelessWidget {
  final Map<String,dynamic> data;
  const ResultScreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ResultCubit>()..getResult(data: data),
      child: BlocBuilder<ResultCubit, ResultState>(
        builder: (context, state) {
          if(state is ResultWaiting){
            return const BasicLoadingScreen();
          } else if (state is ResultFetchFailed){
            return const BasicErrorScreen();
          } else if (state is ResultFetchNotValid){
            return Scaffold(
              appBar: MyAppBar(context: context,appBarTitle: AppStrings.appBarTitle,),
              body: Center(child: Text('Not Valid'),),
            );
          } else {
            return const ValidResultWidget();
          }

        },
      ),
    );
  }
}
