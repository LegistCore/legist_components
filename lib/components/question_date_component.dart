import 'package:flutter/material.dart';
import 'package:legist_components/widgets/base_component_widget.dart';

class QuestionDateComponent extends StatefulWidget {
  const QuestionDateComponent({Key? key}) : super(key: key);

  @override
  State<QuestionDateComponent> createState() => _QuestionDateComponentState();
}

class _QuestionDateComponentState extends State<QuestionDateComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          BaseComponentWidget(
              icon: Icons.calendar_month_outlined,
              questionType: 'Question: Date',
              questionText: 'Select a date, please'),
        ],
      ),
    );
  }
}
