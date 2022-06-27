import 'package:flutter/material.dart';
import 'package:legist_components/widgets/base_component_widget.dart';

class QuestionPhoneComponent extends StatefulWidget {
  const QuestionPhoneComponent({Key? key}) : super(key: key);

  @override
  State<QuestionPhoneComponent> createState() => _QuestionPhoneComponentState();
}

class _QuestionPhoneComponentState extends State<QuestionPhoneComponent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BaseComponentWidget(
          icon: Icons.phone_android_rounded,
          questionType: 'Question: Phone',
          questionText: 'What’s your phone n...'),
    );
  }
}
