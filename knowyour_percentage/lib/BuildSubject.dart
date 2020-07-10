import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'constants.dart';

class BuildSubject extends StatelessWidget {
  BuildSubject({this.marks, this.subject, this.marksFun, this.subFun});
  final Function marksFun;
  final Function subFun;
  final int marks;
  final String subject;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: back_light,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          DropdownButton(
            hint: Text('Subject'),
            underline: SizedBox(),
            dropdownColor: back_dark,
            items: subjects.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            value: subject,
            onChanged: subFun,
          ),
          NumberPicker.horizontal(
            initialValue: marks,
            minValue: 0,
            maxValue: 100,
            listViewHeight: 50,
            onChanged: marksFun,
          )
        ],
      ),
    );
  }
}
