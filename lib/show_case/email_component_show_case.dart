import 'package:flutter/material.dart';
import 'package:legist_components/components/email_component.dart';

import '../widgets/switch_button.dart';
import 'generic_component_show_case.dart';

class EmailComponentShowCase extends StatefulWidget {
  const EmailComponentShowCase({Key? key}) : super(key: key);

  @override
  State<EmailComponentShowCase> createState() => _EmailComponentShowCaseState();
}

class _EmailComponentShowCaseState extends State<EmailComponentShowCase> {
  late Size screenSize;
  bool editMode = true;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController responseController = TextEditingController();

  EmailComponent getWidgetInitializationMode() {
    if (editMode) {
      return EmailComponent.editMode(
        onPressed: () {},
        titleController: titleController,
        descriptionController: descriptionController,
        responseController: responseController,
      );
    } else {
      return EmailComponent.clientMode(
        onPressed: () {},
        title: titleController.text,
        description: descriptionController.text,
        response: responseController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: SwitchButton(
          editMode: editMode,
          onChanged: (bool value) {
            setState(() {
              editMode = value;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: GenericComponentShowCase(
            getWidgetInitializationMode: getWidgetInitializationMode,
            switchButton: SwitchButton(
                editMode: editMode,
                onChanged: (bool value) {
                  setState(() {
                    editMode = value;
                  });
                })));
  }
}
