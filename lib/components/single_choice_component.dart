import 'package:flutter/material.dart';
import 'package:legist_components/widgets/component_choice_widget.dart';

import '../utils/alphabet_utils.dart';
import '../widgets/component_description_text_form_widget.dart';
import '../widgets/component_title_text_form_field_widget.dart';

class SingleChoiceComponent extends StatefulWidget {
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;

  final bool isEditMode;

  final String? title;
  final String? description;

  const SingleChoiceComponent.editMode({
    required this.titleController,
    required this.descriptionController,
    Key? key,
  })  : isEditMode = true,
        title = null,
        description = null,
        super(key: key);

  const SingleChoiceComponent.clientMode({
    required this.title,
    required this.description,
    Key? key,
  })  : titleController = null,
        descriptionController = null,
        isEditMode = false,
        super(key: key);

  @override
  State<SingleChoiceComponent> createState() => _SingleChoiceComponentState();
}

class _SingleChoiceComponentState extends State<SingleChoiceComponent> {
  late FocusNode focusNodeQuestion, focusNodeDescription;
  late AlphabetUtils alphabetUtils;
  List<ComponentChoiceWidget> listChoice = [];

  Color colorFocusQuestion = const Color.fromARGB(255, 77, 77, 77);
  Color colorFocusDescription = const Color.fromARGB(232, 130, 130, 130);

  int alphabetAuxiliaryIndex = 0;
  int? currentIndex;

  @override
  void initState() {
    super.initState();
    focusNodeQuestion = FocusNode();
    focusNodeDescription = FocusNode();
    alphabetUtils = AlphabetUtils();
    addChoice();

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

  Icon? checkIcon;
  List<Widget> changeComponentMode() {
    int tam = listChoice.length;
    setState(
      () {
        listChoice = [];
        for (int i = 0; i < tam; i++) {
          if (widget.isEditMode) {
            listChoice.add(ComponentChoiceWidget(
              isEditMode: true,
              index: i,
              onPressed: null,
              currentIndex: null,
              pressToRemove: () {
                setState(
                  () {
                    listChoice.removeAt(i);
                  },
                );
              },
            ));
          } else {
            listChoice.add(
              ComponentChoiceWidget(
                isEditMode: false,
                index: i,
                onPressed: () {
                  setState(() {
                    if (!widget.isEditMode) {
                      currentIndex = i;
                    }
                  });
                },
                currentIndex: currentIndex,
                pressToRemove: null,
              ),
            );
          }
        }
      },
    );

    return listChoice;
  }

  void addChoice() async {
    if (listChoice.length < 26) {
      setState(() {
        listChoice.add(ComponentChoiceWidget(
          isEditMode: widget.isEditMode,
          index: listChoice.length,
          onPressed: null,
          currentIndex: currentIndex,
          pressToRemove: null,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
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
                ComponentTitleTextFormFieldWidget(
                  isEditMode: widget.isEditMode,
                  titleController: widget.titleController,
                  focusNodeQuestion: focusNodeQuestion,
                  colorFocusQuestion: colorFocusQuestion,
                ),
                ComponentDescriptionTextFormFieldWidget(
                  isEditMode: widget.isEditMode,
                  descriptionController: widget.descriptionController,
                  focusNodeDescription: focusNodeDescription,
                  colorFocusDescription: colorFocusDescription,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Column(
                      children: widget.isEditMode
                          ? changeComponentMode()
                          : changeComponentMode(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    widget.isEditMode
                        ? TextButton(
                            onPressed: () async {
                              addChoice();
                            },
                            child: const Text('Add Choice'),
                          )
                        : TextButton(
                            onPressed: () {},
                            child: const Text(''),
                          ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
