import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nzaker/core/basics/screens/basic_error_screen.dart';
import 'package:nzaker/core/basics/screens/basic_loading_screen.dart';
import 'package:nzaker/core/components/resources/font_manager.dart';
import 'package:nzaker/core/components/resources/string_manager.dart';
import 'package:nzaker/core/components/widgets/app_bar.dart';
import 'package:nzaker/features/results/presentation/widgets/city_card_widget.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/entities/home_entities/home_entity_response.dart';
import '../logic/home/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.sizeOf(context).width;
    final myHeight = MediaQuery.sizeOf(context).height;
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is! HomeInitial) {
            var cubit = HomeCubit.get(context);
            final HomeEntityResponse homeEntityResponse =
                cubit.homeEntityResponse;
            if (state is HomeFetchDataSuccess) {
              return Scaffold(
                appBar: MyAppBar(
                    context: context, appBarTitle: AppStrings.appBarTitle),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        homeEntityResponse.headerText,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: myHeight * 0.01,
                      ),
                      Text(
                        homeEntityResponse.details,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeightManager.semiBold),
                      ),
                      SizedBox(
                        height: myHeight * 0.01,
                      ),
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => CityCardWidget(
                                  country: homeEntityResponse.countries[index]),
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: homeEntityResponse.countries.length))
                    ],
                  ),
                ),
              );
            } else {
              return const BasicErrorScreen();
            }
          } else {
            return const BasicLoadingScreen();
          }
        },
      ),
    );
  }
}
