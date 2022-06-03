import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/component_confirmation_button.dart';
import '../widgets/component_description_text_form_field.dart';
import '../widgets/component_title_text_form_field.dart';

class DateComponent extends StatefulWidget {
  final String? title;
  final String? description;

  final bool isEditMode;

  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final TextEditingController? dayController;
  final TextEditingController? monthController;
  final TextEditingController? yearController;

  const DateComponent.clientMode({
    required this.title,
    required this.description,
    Key? key,
  })  : titleController = null,
        descriptionController = null,
        dayController = null,
        monthController = null,
        yearController = null,
        isEditMode = false,
        super(key: key);

  const DateComponent.editMode({
    required this.titleController,
    required this.descriptionController,
    required this.dayController,
    required this.monthController,
    required this.yearController,
    Key? key,
  })  : title = null,
        description = null,
        isEditMode = true,
        super(key: key);

  @override
  State<DateComponent> createState() => _DateComponentState();
}

class _DateComponentState extends State<DateComponent> {
  late FocusNode focusNodeQuestion, focusNodeDescription;
  Color colorFocusQuestion = const Color.fromARGB(255, 77, 77, 77);
  Color colorFocusDescription = const Color.fromARGB(232, 130, 130, 130);
  bool readonly = true;

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
            '3',
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
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Day',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 24, 71, 169),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                          ],
                          style: const TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 24, 71, 169),
                          ),
                          cursorColor: getBorderColorTextFormField(),
                          readOnly: widget.isEditMode,
                          controller: widget.dayController,
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
                            hintText: 'DD',
                            hintStyle: const TextStyle(
                              fontSize: 26,
                              color: Color.fromARGB(232, 179, 196, 227),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text(
                      '/',
                      style: TextStyle(
                        fontSize: 29,
                        color: Color.fromARGB(255, 24, 71, 169),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Month',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 24, 71, 169),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                          ],
                          style: const TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 24, 71, 169),
                          ),
                          cursorColor: getBorderColorTextFormField(),
                          readOnly: widget.isEditMode,
                          controller: widget.monthController,
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
                            hintText: 'MM',
                            hintStyle: const TextStyle(
                              fontSize: 26,
                              color: Color.fromARGB(232, 179, 196, 227),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text(
                      '/',
                      style: TextStyle(
                        fontSize: 29,
                        color: Color.fromARGB(255, 24, 71, 169),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Year',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 24, 71, 169),
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4),
                          ],
                          style: const TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 24, 71, 169),
                          ),
                          cursorColor: getBorderColorTextFormField(),
                          readOnly: widget.isEditMode,
                          controller: widget.yearController,
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
                            hintText: 'YYYY',
                            hintStyle: const TextStyle(
                              fontSize: 26,
                              color: Color.fromARGB(232, 179, 196, 227),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              widget.isEditMode
                  ? const SizedBox(
                      height: 37,
                    )
                  : ComponentConfirmationButton(
                      textComponent: 'OK',
                      onPressed: () {},
                      showHint: false,
                    ),
            ],
          ),
        )
      ],
    );
  }
}
