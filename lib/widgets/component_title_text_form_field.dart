import 'package:flutter/material.dart';

class ComponentTitleTextFormField extends StatefulWidget {
  final bool isEditMode;
  final TextEditingController? titleController;
  final FocusNode? focusNodeQuestion;
  final Color colorFocusQuestion;
  const ComponentTitleTextFormField({
    required this.isEditMode,
    required this.titleController,
    required this.focusNodeQuestion,
    required this.colorFocusQuestion,
    Key? key,
  }) : super(key: key);

  @override
  State<ComponentTitleTextFormField> createState() =>
      _ComponentTitleTextFormFieldState();
}

class _ComponentTitleTextFormFieldState
    extends State<ComponentTitleTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 23,
      child: TextFormField(
        enabled: widget.isEditMode,
        readOnly: !widget.isEditMode,
        style: const TextStyle(
          fontSize: 20,
        ),
        controller: widget.titleController,
        focusNode: widget.focusNodeQuestion,
        cursorColor: const Color.fromARGB(255, 193, 193, 193),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.isEditMode
              ? 'Your question here. Recall information with @'
              : '...',
          hintStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: widget.colorFocusQuestion,
          ),
        ),
      ),
    );
  }
}
