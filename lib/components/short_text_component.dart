import 'package:flutter/material.dart';

import '../widgets/component_confirmation_button.dart';
import '../widgets/component_description_text_form_field.dart';
import '../widgets/component_title_text_form_field.dart';

class ShortTextComponent extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? title;
  final String? description;

  final bool isEditMode;

  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final TextEditingController? responseController;

  const ShortTextComponent.editMode({
    required this.onPressed,
    required this.titleController,
    required this.descriptionController,
    required this.responseController,
    Key? key,
  })  : title = null,
        description = null,
        isEditMode = true,
        super(key: key);

  const ShortTextComponent.clientMode({
    required this.onPressed,
    required this.title,
    required this.description,
    Key? key,
  })  : titleController = null,
        descriptionController = null,
        isEditMode = false,
        responseController = null,
        super(key: key);

  @override
  State<ShortTextComponent> createState() => _ShortTextComponentState();
}

class _ShortTextComponentState extends State<ShortTextComponent> {
  late FocusNode focusNodeQuestion, focusNodeDescription;
  Color colorFocusQuestion = const Color.fromARGB(255, 77, 77, 77);
  Color colorFocusDescription = const Color.fromARGB(232, 130, 130, 130);

  @override
  void initState() {
    super.initState();
    focusNodeQuestion = FocusNode();
    focusNodeDescription = FocusNode();

    focusNodeQuestion.addListener(() {
      setState(() {
        colorFocusQuestion = focusNodeQuestion.hasFocus
            ? const Color.fromARGB(255, 193, 193, 193)
            : const Color.fromARGB(255, 77, 77, 77);
      });
    });

    focusNodeDescription.addListener(() {
      setState(() {
        colorFocusDescription = focusNodeDescription.hasFocus
            ? const Color.fromARGB(255, 193, 193, 193)
            : const Color.fromARGB(232, 130, 130, 130);
      });
    });
  }

  Color getBorderColorTextFormField() {
    return widget.isEditMode
        ? const Color.fromARGB(232, 192, 209, 247)
        : const Color.fromARGB(255, 24, 71, 169);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16),
          child: const Text(
            '2',
            style: TextStyle(
              color: Color.fromRGBO(24, 71, 169, 1),
            ),
          ),
        ),
        const SizedBox(
          height: 49,
          child: Icon(
            Icons.arrow_right_alt_rounded,
            color: Color.fromRGBO(24, 71, 169, 1),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ComponentTitleTextFormField(
                isEditMode: widget.isEditMode,
                titleController: widget.titleController,
                focusNodeQuestion: focusNodeQuestion,
                colorFocusQuestion: colorFocusQuestion,
              ),
              ComponentDescriptionTextFormField(
                isEditMode: widget.isEditMode,
                descriptionController: widget.descriptionController,
                focusNodeDescription: focusNodeDescription,
                colorFocusDescription: colorFocusDescription,
              ),
              TextFormField(
                controller: widget.responseController,
                style: const TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 24, 71, 169),
                ),
                cursorColor: getBorderColorTextFormField(),
                readOnly: widget.isEditMode,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: getBorderColorTextFormField(),
                    ),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 192, 209, 247),
                    ),
                  ),
                  hintText: 'Type your answer here...',
                  hintStyle: const TextStyle(
                    fontSize: 26,
                    color: Color.fromARGB(232, 179, 196, 227),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ComponentConfirmationButton(
                textComponent: 'OK',
                onPressed: () {},
                showHint: true,
              ),
            ],
          ),
        )
      ],
    );
  }
}
