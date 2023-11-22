import 'package:flutter/material.dart';
import 'package:nzaker/core/components/resources/color_manager.dart';

class StudentDataRowWidget extends StatelessWidget {
  final String studentDataKey;
  final String studentDataValue;
  const StudentDataRowWidget({super.key,required this.studentDataKey,required this.studentDataValue});

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.sizeOf(context).width;
    final myHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: myWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: myWidth*0.02,vertical: myHeight*0.005),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Text('$studentDataKey :',style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),)),
            Expanded(
                flex: 5,
                child: Center(child: Text(studentDataValue,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.black),textAlign: TextAlign.center,)))
          ],
        ),
      ),
    );
  }
}
