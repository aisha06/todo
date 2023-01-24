import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Toggle extends StatefulWidget {
  Toggle({super.key});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  ViewType _viewType = ViewType.grid;
  int _crossAxisCount = 2;

  double _aspectRatio = 1.5;
  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth:50.0,
      cornerRadius: 20.0,
      activeBgColors: [[Colors.green[800]!], [Colors.red[800]!]],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      initialLabelIndex: 1,
      totalSwitches: 2,
      labels: const ['True', 'False'],
      radiusStyle: true,
      onToggle: (index) {
        print('switched to: $index');
        if (_viewType == ViewType.list) {
          _crossAxisCount = 2;
          _aspectRatio = 1.5;
          _viewType = ViewType.grid;
        } else {
          _crossAxisCount = 1;
          _aspectRatio = 5;
          _viewType = ViewType.list;
        }
        setState(() {});
      },
    );
  }
}
enum ViewType { grid, list }