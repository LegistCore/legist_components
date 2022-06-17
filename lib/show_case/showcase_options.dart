import 'package:flutter/material.dart';
import 'package:legist_components/show_case/single_choice_component_show_case.dart';

import '../widgets/show_case_presentation_button_widget.dart';
import 'date_component_show_case.dart';
import 'email_component_show_case.dart';
import 'long_text_show_case.dart';
import 'multiple_choice_component_show_case.dart';
import 'phone_number_component_show_case.dart';
import 'short_text_show_case.dart';

class ShowCaseOptions extends StatelessWidget {
  const ShowCaseOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(
          child: SizedBox(
              width: 600,
              height: 300,
              child: GridView.count(
                childAspectRatio: 2.5,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  ShowCasePresentationButtonWidget(
                    iconComponent: const Icon(Icons.date_range),
                    textComponent: 'Date',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const DateComponentShowCase(),
                        ),
                      );
                    },
                  ),
                  ShowCasePresentationButtonWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmailComponentShowCase(),
                        ),
                      );
                    },
                    iconComponent: const Icon(Icons.email),
                    textComponent: 'Email',
                  ),
                  ShowCasePresentationButtonWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ShortTextComponentShowCase(),
                        ),
                      );
                    },
                    iconComponent: const Icon(Icons.text_fields),
                    textComponent: 'Short Text',
                  ),
                  ShowCasePresentationButtonWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const LongTextComponentShowCase(),
                        ),
                      );
                    },
                    iconComponent: const Icon(Icons.text_fields),
                    textComponent: 'Long Text',
                  ),
                  ShowCasePresentationButtonWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const PhoneNumberComponentShowCase(),
                        ),
                      );
                    },
                    iconComponent: const Icon(Icons.phone),
                    textComponent: 'Phone Number',
                  ),
                  ShowCasePresentationButtonWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SingleChoiceComponentShowCase(),
                        ),
                      );
                    },
                    iconComponent: const Icon(Icons.chat_outlined),
                    textComponent: 'Single Choice',
                  ),
                  ShowCasePresentationButtonWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MultipleChoiceComponentShowCase(),
                        ),
                      );
                    },
                    iconComponent: const Icon(Icons.chat_outlined),
                    textComponent: 'Multiple Choice',
                  ),
                ],
              )),
        ));
  }
}
