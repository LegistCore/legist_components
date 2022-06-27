import 'package:flutter/material.dart';
import 'package:legist_components/widgets/base_component_widget.dart';

class QuestionEmailComponent extends StatefulWidget {
  const QuestionEmailComponent({Key? key}) : super(key: key);

  @override
  State<QuestionEmailComponent> createState() => _QuestionEmailComponentState();
}

class _QuestionEmailComponentState extends State<QuestionEmailComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          BaseComponentWidget(
              icon: Icons.email_outlined,
              questionType: 'Question: Email',
              questionText: 'What’s your email?'),
        ],
      ),
    );
  }
}
