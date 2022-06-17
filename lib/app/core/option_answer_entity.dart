import 'package:legist_components/app/core/answer_enitity.dart';

class OptionAnswerEntity extends AnswerEntity {
  OptionAnswerEntity({
    required super.answerId,
    required this.orderIndex,
    required this.answerText,
    this.nextQuestionId,
  });

  String answerText;
  int? nextQuestionId;
  int orderIndex;
}
