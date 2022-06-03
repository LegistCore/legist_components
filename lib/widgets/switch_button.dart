// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final bool editMode;
  const SwitchButton({
    required this.editMode,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: widget.onChanged,
      value: widget.editMode,
    );
  }
}
