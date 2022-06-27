import 'package:flutter/material.dart';
import 'package:legist_components/widgets/base_component_widget.dart';

class QuestionTextComponent extends StatefulWidget {
  const QuestionTextComponent({Key? key}) : super(key: key);

  @override
  State<QuestionTextComponent> createState() => _QuestionTextComponentState();
}

class _QuestionTextComponentState extends State<QuestionTextComponent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BaseComponentWidget(
          icon: Icons.textsms_rounded,
          questionType: 'Question: Text',
          questionText: 'What do you think?'),
    );
  }
}
