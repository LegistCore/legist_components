import 'package:legist_components/app/core/coordinates_entity.dart';
import 'package:legist_components/app/core/option_answer_entity.dart';
import 'package:legist_components/app/core/question_entity.dart';

class MultipleChoiceQuestionEntity extends QuestionEntity {
  MultipleChoiceQuestionEntity({
    required super.questionId,
    required this.defaultAnswer,
    required this.options,
    required this.text,
    required super.coordinates,
  });

  String text;
  List<OptionAnswerEntity> options;
  OptionAnswerEntity defaultAnswer;
}
