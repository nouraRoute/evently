import 'package:evently/common/app_assets.dart';
import 'package:flutter/material.dart';

class LocalizationSwitch extends StatefulWidget {
  const LocalizationSwitch({super.key});

  @override
  State<LocalizationSwitch> createState() => _LocalizationSwitchState();
}

class _LocalizationSwitchState extends State<LocalizationSwitch> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: _value,
        onChanged: (value) {
          _value = value;
          setState(() {});
        },
        activeThumbImage: AssetImage(AppAssets.egIcon),
        inactiveThumbImage: AssetImage(AppAssets.lrIcon));
  }
}
