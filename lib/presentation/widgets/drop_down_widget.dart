import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jalali_calendar/jalali_calendar.dart';
class DropDown extends StatefulWidget {
  ValueChanged<String> parentAction;
  String selectedYear;

  DropDown({this.parentAction,this.selectedYear});
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = 'Production Year'.tr;

  List <String> spinnerItems = [] ;


  @override
  void initState() {
    super.initState();
    if(widget.selectedYear!='')
      dropdownValue = widget.selectedYear;
    spinnerItems.add('Production Year'.tr);
    PersianDate pDate = PersianDate();
    for(int i = 1380;i<=pDate.year;i++)
      spinnerItems.add((i).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:
      DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        // style: TextStyle(color: Colors.red, fontSize: 18),
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        onChanged: (String data) {
          setState(() {
            dropdownValue = data;
            widget.parentAction(dropdownValue);
          });
        },
        items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
