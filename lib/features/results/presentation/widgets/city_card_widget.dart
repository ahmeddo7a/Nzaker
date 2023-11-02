import 'package:flutter/material.dart';
import 'package:nzaker/core/basics/screen_arguments_class.dart';
import 'package:nzaker/core/components/resources/route_manager.dart';
import 'package:nzaker/features/results/domain/entities/home_entities/countries_entity.dart';

class CityCardWidget extends StatelessWidget {
  final CountriesEntity country;
  const CityCardWidget({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.countryDetailsRoute,arguments: ScreenArguments<String>(data: country.countryName));
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(country.countryName,style: Theme.of(context).textTheme.bodyLarge,),
              SizedBox(height: myHeight*0.01,),
              Text(country.title,style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
        ),
      ),
    );
  }
}
