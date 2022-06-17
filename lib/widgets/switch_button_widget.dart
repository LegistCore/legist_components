// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SwitchButtonWidget extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final bool editMode;

  const SwitchButtonWidget({
    required this.editMode,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<SwitchButtonWidget> createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: widget.onChanged,
      value: widget.editMode,
    );
  }
}
