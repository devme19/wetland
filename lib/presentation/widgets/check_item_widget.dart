import 'package:flutter/material.dart';
import 'package:wetland/presentation/helper/check_item.dart';
class CheckItemWidget extends StatefulWidget {

  ValueChanged<CheckItem> returnCheckItem;
  CheckItem checkItem;
  CheckItemWidget({this.checkItem,this.returnCheckItem});

  @override
  _CheckItemWidgetState createState() => _CheckItemWidgetState();
}

class _CheckItemWidgetState extends State<CheckItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      // width: 100,
      child:
      Row(
        children: [
          Text(
            widget.checkItem.title,
            style: TextStyle(color: Color(0xffA1977D)),
          ),
          Checkbox(activeColor: Color(0xffA1977D),value: widget.checkItem.isCheck, onChanged: (bool value) {
            if(value && !widget.checkItem.isCheck ) {
                  setState(() {
                    widget.checkItem.isCheck = value;
                  });
                  widget.returnCheckItem(widget.checkItem);
                }
              })
        ],
      ),
    );
  }
}
