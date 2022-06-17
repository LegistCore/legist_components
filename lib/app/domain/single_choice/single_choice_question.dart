import 'package:legist_components/app/core/option_answer_entity.dart';
import 'package:legist_components/app/core/question_entity.dart';

class SingleChoiceQuestionEntity extends QuestionEntity {
  SingleChoiceQuestionEntity({
    required super.questionId,
    required this.defaultAnswer,
    required this.options,
    required this.questionText,
    required super.coordinates,
  });

  String questionText;
  List<OptionAnswerEntity> options;
  OptionAnswerEntity defaultAnswer;
}
