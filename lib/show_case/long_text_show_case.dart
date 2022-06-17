import 'package:flutter/material.dart';

import '../components/long_text_components.dart';
import '../widgets/switch_button_widget.dart';
import 'generic_component_show_case.dart';

class LongTextComponentShowCase extends StatefulWidget {
  const LongTextComponentShowCase({Key? key}) : super(key: key);

  @override
  State<LongTextComponentShowCase> createState() =>
      _LongTextComponentShowCaseState();
}

class _LongTextComponentShowCaseState extends State<LongTextComponentShowCase> {
  late Size screenSize;
  late bool editMode = true;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController responseController = TextEditingController();

  LongTextComponent getWidgetInitializationMode() {
    if (editMode) {
      return LongTextComponent.editMode(
        onPressed: () {},
        titleController: titleController,
        descriptionController: descriptionController,
        responseController: responseController,
      );
    } else {
      return LongTextComponent.clientMode(
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
      floatingActionButton: SwitchButtonWidget(
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
        switchButton: SwitchButtonWidget(
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
