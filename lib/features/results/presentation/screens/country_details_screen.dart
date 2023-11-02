import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nzaker/core/basics/screens/basic_error_screen.dart';
import 'package:nzaker/core/basics/screens/basic_loading_screen.dart';
import 'package:nzaker/core/components/resources/color_manager.dart';
import 'package:nzaker/core/components/resources/font_manager.dart';
import 'package:nzaker/core/components/resources/string_manager.dart';
import 'package:nzaker/core/components/widgets/app_bar.dart';
import 'package:nzaker/core/components/widgets/custom_button.dart';
import 'package:nzaker/core/components/widgets/custom_form_field.dart';
import 'package:nzaker/features/results/domain/entities/country_details_entities/country_details_entity.dart';
import 'package:nzaker/features/results/presentation/logic/country_details/country_details_cubit.dart';

import '../../../../core/services/service_locator.dart';

class CountryDetailsScreen extends StatelessWidget {
  final String countryName;
  const CountryDetailsScreen({super.key,required this.countryName});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => sl<CountryDetailsCubit>()..getCountryDetails(countryName),
      child: BlocBuilder<CountryDetailsCubit, CountryDetailsState>(
        builder: (context, state) {
          if (state is! CountryDetailsWaiting) {
            var cubit = CountryDetailsCubit.get(context);
            if (cubit.countryDetails != null) {
              final CountryDetailsEntity countryDetails = cubit.countryDetails!;
              return Scaffold(
                appBar: MyAppBar(
                  context: context,
                  appBarTitle: AppStrings.appBarTitle,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
                    child: Column(
                      children: [
                        Text(
                          countryDetails.headerText,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: myHeight * 0.01,
                        ),
                        Text(
                          countryDetails.countryDescription,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeightManager.semiBold),
                        ),
                        SizedBox(height: myHeight*0.01,),
                        Text(AppStrings.enterSeatNumber,style: Theme.of(context).textTheme.bodyLarge,),
                        SizedBox(height: myHeight*0.02,),
                        CustomFormField(
                            customFieldType: CustomFieldType.custom,
                            label: AppStrings.seatNumber,
                            myStyle: Theme.of(context).textTheme.bodyMedium,
                          inputType: TextInputType.number,
                          onChange: (String value){
                              cubit.seatNumber = value;
                          },
                        ),
                        SizedBox(height: myHeight*0.02,),
                        SizedBox(
                            width: myWidth*0.55,
                            child: CustomButton(onPressed: (){}, widget: Text(AppStrings.search,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.white),)))

                      ],
                    ),
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
