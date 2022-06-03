import 'package:flutter/material.dart';
import 'package:legist_components/show_case/generic_component_show_case.dart';
import 'package:legist_components/widgets/switch_button.dart';

import '../components/phone_number_component.dart';

class PhoneNumberComponentShowCase extends StatefulWidget {
  const PhoneNumberComponentShowCase({Key? key}) : super(key: key);

  @override
  State<PhoneNumberComponentShowCase> createState() =>
      _PhoneNumberComponentShowCaseState();
}

class _PhoneNumberComponentShowCaseState
    extends State<PhoneNumberComponentShowCase> {
  late Size screenSize;
  late bool editMode = true;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController responseController = TextEditingController();

  PhoneNumberComponent getWidgetInitializationMode() {
    if (editMode) {
      return PhoneNumberComponent.editMode(
        onPressed: () {},
        titleController: titleController,
        descriptionController: descriptionController,
        responseController: responseController,
      );
    } else {
      return PhoneNumberComponent.clientMode(
        onPressed: () {},
        title: titleController.text,
        description: descriptionController.text,
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
