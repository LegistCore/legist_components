import 'package:flutter/material.dart';

class LongTextComponent extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? title;
  final String? description;
  final String? response;
  final bool isEditMode;
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final TextEditingController? responseController;

  const LongTextComponent.editMode({
    required this.onPressed,
    required this.titleController,
    required this.descriptionController,
    required this.responseController,
    Key? key,
  })  : title = null,
        description = null,
        isEditMode = true,
        response = null,
        super(key: key);

  const LongTextComponent.clientMode({
    required this.onPressed,
    required this.title,
    required this.description,
    required this.response,
    Key? key,
  })  : titleController = null,
        descriptionController = null,
        isEditMode = false,
        responseController = null,
        super(key: key);

  @override
  State<LongTextComponent> createState() => _LongTextComponentState();
}

class _LongTextComponentState extends State<LongTextComponent> {
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

  Color setBorderColorTextFormField() {
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
            '4',
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
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 23,
                child: TextFormField(
                  enabled: widget.isEditMode,
                  readOnly: !widget.isEditMode,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  controller: widget.titleController,
                  focusNode: focusNodeQuestion,
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
                      color: colorFocusQuestion,
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: widget.descriptionController,
                enabled: widget.isEditMode,
                style: const TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(232, 75, 75, 75),
                ),
                focusNode: focusNodeDescription,
                cursorColor: const Color.fromARGB(255, 193, 193, 193),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.isEditMode ? 'Description (optional)' : '',
                  hintStyle: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: colorFocusDescription,
                  ),
                ),
              ),
              TextFormField(
                controller: widget.responseController,
                minLines: 1,
                maxLines: 5,
                // maxLength: 1000,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 24, 71, 169),
                ),
                cursorColor: setBorderColorTextFormField(),
                readOnly: widget.isEditMode,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: setBorderColorTextFormField(),
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
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: const [
                    Text(
                      'Enter',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 24, 71, 169),
                      ),
                    ),
                    Icon(
                      Icons.subdirectory_arrow_left,
                      size: 10,
                      color: Color.fromARGB(255, 24, 71, 169),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'to make a line break',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 24, 71, 169),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 37,
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'OK',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 24, 71, 169),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'press',
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    'Enter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  const Icon(
                    Icons.subdirectory_arrow_left,
                    size: 10,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
