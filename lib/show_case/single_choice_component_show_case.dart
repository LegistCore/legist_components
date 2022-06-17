import 'package:flutter/material.dart';
import 'package:legist_components/components/single_choice_component.dart';
import 'package:legist_components/widgets/switch_button_widget.dart';

class SingleChoiceComponentShowCase extends StatefulWidget {
  const SingleChoiceComponentShowCase({Key? key}) : super(key: key);

  @override
  State<SingleChoiceComponentShowCase> createState() =>
      _SingleChoiceComponentShowCaseState();
}

class _SingleChoiceComponentShowCaseState
    extends State<SingleChoiceComponentShowCase> {
  late Size screenSize;
  late bool editMode = true;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController responseController = TextEditingController();

  SingleChoiceComponent getWidgetInitializationMode() {
    if (editMode) {
      return SingleChoiceComponent.editMode(
        titleController: titleController,
        descriptionController: descriptionController,
      );
    } else {
      return SingleChoiceComponent.clientMode(
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
              if (editMode) {
                SingleChoiceComponent.editMode(
                  titleController: titleController,
                  descriptionController: descriptionController,
                );
              }
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: const Color.fromARGB(255, 250, 250, 250),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color.fromARGB(66, 7, 0, 0),
                      blurRadius: 2.0,
                      offset: Offset(0.0, 0.75),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.only(left: 150, right: 150),
                width: screenSize.width * 0.65,
                height: screenSize.height * 0.65,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [getWidgetInitializationMode()],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    width: 60,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 24, 71, 169),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      'Cliente',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    width: 60,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(232, 192, 209, 247),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Edicão',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(24, 71, 169, 1)),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
