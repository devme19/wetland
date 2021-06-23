import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetland/core/config/config.dart';
import 'package:wetland/presentation/navigations/wetlands.dart';

class Menu extends StatefulWidget {
  final String title;
  final String icon;
  final String id;
  final bool isEn;

  Menu({this.title, this.icon,this.id,this.isEn});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  onTap()async{
    await Future.delayed(const Duration(milliseconds: 300));
    Get.toNamed(WetLandsRoutes.contentPage,arguments: [widget.id,widget.isEn]).then((value) =>cardKey.currentState.toggleCard());
  }
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: cardKey,
      direction: FlipDirection.HORIZONTAL,
      front:
      InkWell(
        onTap: (){
          onTap();
          cardKey.currentState.toggleCard();
        },
        child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.1,
                    blurRadius: 1,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                color: Color(0xffE8E1CD),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius))
            ),
            // color: Colors.grey,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(widget.icon),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(widget.title,style: TextStyle(color: Color(0xff7F2C17),),textAlign: TextAlign.center,)),
              ],
            )
        ),
      ),
      back: Container(child: Center(
        child: Text(widget.title,style: TextStyle(color: pColor,),),
      ),),
    );
  }
}