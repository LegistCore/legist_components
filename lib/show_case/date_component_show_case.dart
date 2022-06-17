import 'package:flutter/material.dart';

import '../components/date_component.dart';
import '../widgets/switch_button_widget.dart';
import 'generic_component_show_case.dart';

class DateComponentShowCase extends StatefulWidget {
  const DateComponentShowCase({Key? key}) : super(key: key);

  @override
  State<DateComponentShowCase> createState() => _DateComponentShowCaseState();
}

class _DateComponentShowCaseState extends State<DateComponentShowCase> {
  late Size screenSize;
  late bool editMode = true;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  DateComponent getWidgetInitializationMode() {
    if (editMode) {
      return DateComponent.editMode(
        titleController: titleController,
        descriptionController: descriptionController,
        dayController: dayController,
        monthController: monthController,
        yearController: yearController,
      );
    } else {
      return DateComponent.clientMode(
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
