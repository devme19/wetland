import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:wetland/data/model/view_model.dart';
import 'package:get/get.dart';
class MultiSelectWidget extends StatefulWidget {
  List<Tree> tree;
  MultiSelectWidget({this.tree});

  @override
  _MultiSelectWidgetState createState() => _MultiSelectWidgetState();
}

class _MultiSelectWidgetState extends State<MultiSelectWidget> {
  var _items;
  List<Tree> selectedTree=[];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
      key: _multiSelectKey,
      items: _items,
      chipDisplay: MultiSelectChipDisplay(),
      // listType: MultiSelectListType.CHIP,
      cancelText: Text('Cancel'.tr),
      confirmText: Text('Confirm'.tr),
      title: Text('Knowledge tree'.tr),
      initialValue: selectedTree,
      selectedItemsTextStyle: TextStyle(fontWeight: FontWeight.bold),
      searchable: true,
      searchHint: 'Search'.tr,
      selectedColor: Colors.red,
      decoration: BoxDecoration(
        // color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      // buttonIcon: Icon(
      //   Icons.account_tree,
      //   color: Colors.blue,
      // ),
      buttonText: Text(
        'Select knowledge tree'.tr,
        // style: TextStyle(
        //   color: Colors.blue[800],
        //   fontSize: 16,
        // ),
      ),
      onConfirm: (results) {
        selectedTree = results.map((e)=> e as Tree).toList();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _items = widget.tree
        .map((tree) => MultiSelectItem<Tree>(tree, tree.title))
        .toList();
  }
}
