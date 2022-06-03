import 'package:flutter/material.dart';

class ComponentDescriptionTextFormField extends StatefulWidget {
  final bool isEditMode;
  final TextEditingController? descriptionController;
  final FocusNode? focusNodeDescription;
  final Color colorFocusDescription;

  const ComponentDescriptionTextFormField({
    required this.isEditMode,
    required this.descriptionController,
    required this.focusNodeDescription,
    required this.colorFocusDescription,
    Key? key,
  }) : super(key: key);

  @override
  State<ComponentDescriptionTextFormField> createState() =>
      _ComponentDescriptionTextFormFieldState();
}

class _ComponentDescriptionTextFormFieldState
    extends State<ComponentDescriptionTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.descriptionController,
      enabled: widget.isEditMode,
      style: const TextStyle(
        fontSize: 17,
        color: Color.fromARGB(232, 75, 75, 75),
      ),
      focusNode: widget.focusNodeDescription,
      cursorColor: const Color.fromARGB(255, 193, 193, 193),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.isEditMode ? 'Description (optional)' : '',
        hintStyle: TextStyle(
          fontSize: 17,
          fontStyle: FontStyle.italic,
          color: widget.colorFocusDescription,
        ),
      ),
    );
  }
}
