import 'package:flutter/material.dart';

import '../components/short_text_component.dart';
import '../widgets/switch_button.dart';
import 'generic_component_show_case.dart';

class ShortTextComponentShowCase extends StatefulWidget {
  const ShortTextComponentShowCase({Key? key}) : super(key: key);

  @override
  State<ShortTextComponentShowCase> createState() =>
      _ShortTextComponentShowCaseState();
}

class _ShortTextComponentShowCaseState
    extends State<ShortTextComponentShowCase> {
  late Size screenSize;
  late bool editMode = true;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController responseController = TextEditingController();

  ShortTextComponent getWidgetInitializationMode() {
    if (editMode) {
      return ShortTextComponent.editMode(
        onPressed: () {},
        titleController: titleController,
        descriptionController: descriptionController,
        responseController: responseController,
      );
    } else {
      return ShortTextComponent.clientMode(
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
          },
        ),
      ),
    );
  }
}
