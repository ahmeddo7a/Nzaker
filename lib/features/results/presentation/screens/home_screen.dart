import 'package:flutter/material.dart';
import 'package:nzaker/features/results/domain/entities/countries_entity.dart';
import 'package:nzaker/features/results/domain/entities/home_entity_response.dart';
import 'package:nzaker/features/results/presentation/widgets/city_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.sizeOf(context).width;
    final myHeight = MediaQuery.sizeOf(context).height;
    const HomeEntityResponse homeEntityResponse = HomeEntityResponse(
        headerText: 'headerText', details: 'details', countries: [CountriesEntity(countryName: 'countryName', title: 'title'),CountriesEntity(countryName: 'countryName', title: 'title')]);
    return Scaffold(
      appBar: AppBar(),
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
              height: myHeight * 0.02,
            ),
            Text(
              homeEntityResponse.details,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: myHeight * 0.02,
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => CityCardWidget(
                        country: homeEntityResponse.countries[index]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: homeEntityResponse.countries.length))
          ],
        ),
      ),
    );
  }
}
