import 'package:flutter/material.dart';

import 'email_component_show_case.dart';
import 'long_text_show_case.dart';
import 'phone_number_component_show_case.dart';
import 'short_text_show_case.dart';
import 'single_choice_component_show_case.dart';

class ShowCase extends StatefulWidget {
  const ShowCase({Key? key}) : super(key: key);

  @override
  State<ShowCase> createState() => _ShowCaseState();
}

class _ShowCaseState extends State<ShowCase> {
  Widget componentChoice = const EmailComponentShowCase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.15,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      componentChoice = const EmailComponentShowCase();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 123, 219, 218),
                          ),
                          width: 50,
                          child: const Icon(
                            Icons.email,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Email'),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      componentChoice = const ShortTextComponentShowCase();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 122, 180, 246),
                          ),
                          width: 50,
                          child: const Icon(
                            Icons.text_fields_rounded,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Short Text'),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      componentChoice = const LongTextComponentShowCase();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 82, 156, 244),
                          ),
                          width: 50,
                          child: const Icon(
                            Icons.text_fields_outlined,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Long Text'),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      componentChoice = const PhoneNumberComponentShowCase();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 165, 206, 249),
                          ),
                          width: 50,
                          child: const Icon(
                            Icons.phone,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Phone Number'),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      componentChoice = const SingleChoiceComponentShowCase();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 186, 233, 228),
                          ),
                          width: 50,
                          child: const Icon(
                            Icons.email,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Single Choice'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: componentChoice,
            ),
          ),
        ],
      ),
    );
  }
}
