import 'package:flutter/material.dart';

import '../widgets/show_case_presentation_button.dart';
import 'date_component_show_case.dart';
import 'email_component_show_case.dart';
import 'long_text_show_case.dart';
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
              height: 200,
              child: GridView.count(
                childAspectRatio: 2.5,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  ShowCasePresentationButton(
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
                  ShowCasePresentationButton(
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
                  ShowCasePresentationButton(
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
                  ShowCasePresentationButton(
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
                  ShowCasePresentationButton(
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
                ],
              )),
        ));
  }
}
