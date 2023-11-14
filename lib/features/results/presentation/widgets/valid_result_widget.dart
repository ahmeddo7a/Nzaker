import 'package:flutter/material.dart';
import 'package:nzaker/core/components/resources/color_manager.dart';
import 'package:nzaker/core/components/resources/size_manager.dart';
import 'package:nzaker/core/components/widgets/app_bar.dart';
import 'package:nzaker/features/results/presentation/logic/result/result_cubit.dart';
import 'package:nzaker/features/results/presentation/widgets/result_widgets/student_data_row_widget.dart';

import '../../../../core/components/resources/string_manager.dart';

class ValidResultWidget extends StatelessWidget {
  const ValidResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    final cubit = ResultCubit.get(context);
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        appBarTitle: AppStrings.appBarTitle,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: myWidth*0.05,vertical: myHeight*0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cubit.natigaEntity.headerText,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: myHeight * 0.01,
              ),
              Text(
                cubit.natigaEntity.message,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.grey),
              ),
              SizedBox(
                height: myHeight * 0.02,
              ),
              Text('${cubit.natigaEntity.results!.studentDataHeader} :',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.cautionColor,fontSize: 20),),
              SizedBox(
                height: myHeight * 0.01,
              ),
              SizedBox(
                height: myHeight*0.35,
                child: Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(SizeManager.smallRadius))
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: myWidth*0.02,vertical: myHeight*0.005),
                      child: ListView.builder(
                          itemBuilder: (context, index) => StudentDataRowWidget(
                              studentDataKey:cubit.studentDataKeys[index],
                              studentDataValue: cubit.studentDataValues[index]
                          ),
                          itemCount: cubit.studentDataValues.length),
                    )),
              ),
              SizedBox(height: myHeight*0.02,),
              Text('${cubit.natigaEntity.results!.subjectDataHeader} :',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.cautionColor,fontSize: 20),),
              SizedBox(height: myHeight*0.01,),

              Card (
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(SizeManager.smallRadius))
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth*0.02,vertical: myHeight*0.005),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => StudentDataRowWidget(
                            studentDataKey:cubit.subjectDataKeys[index],
                            studentDataValue: cubit.subjectDataValues[index]
                        ),
                        itemCount: cubit.subjectDataValues.length),
                  ),
              ),
              SizedBox(height: myHeight*0.2,),
              Text('GO TO SITE')
            ],
          ),
        ),
      ),
    );
  }
}
