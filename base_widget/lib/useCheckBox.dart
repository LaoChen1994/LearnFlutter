import 'package:flutter/material.dart';

class SwitchComponent extends StatefulWidget {
  SwitchComponent({Key key}) : super(key: key);

  @override
  _SwitchComponentState createState() => _SwitchComponentState();
}

class _SwitchComponentState extends State<SwitchComponent> {
  bool _switchSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        value: _switchSelected,
        onChanged: (value) {
          print(value);
          setState(() {
            _switchSelected = value;
          });
        },
        activeColor: Colors.red,
        hoverColor: Colors.greenAccent,
      ),
      width: 120,
    );
  }
}

class CheckList extends StatefulWidget {
  final List<Map<String, Object>> checkList;
  void getValue;
  CheckList({Key key, @required this.checkList, this.getValue})
      : super(key: key);

  @override
  _CheckListState createState() => _CheckListState(checkList: checkList);
}

class _CheckListState extends State<CheckList> {
  final List<Map<String, Object>> checkList;

  _CheckListState({Key key, @required this.checkList});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = checkList
        .map((item) => CheckboxWithName(
            name: item['name'],
            checked: item['checked'],
            onChange: (value) {
              setState(() {
                item["checked"] = value;
              });
            }))
        .toList();

    return FractionallySizedBox(
      child: Row(children: list),
      widthFactor: 0.9,
      alignment: Alignment.center,
    );
  }
}

class CheckboxWithName extends StatelessWidget {
  final String name;
  final bool checked;
  final Function onChange;
  const CheckboxWithName(
      {Key key,
      @required this.name,
      @required this.checked,
      @required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('$name'),
        Checkbox(value: checked, onChanged: onChange)
      ],
    );
  }
}
