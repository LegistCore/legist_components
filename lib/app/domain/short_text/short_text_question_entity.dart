import 'package:legist_components/app/core/question_entity.dart';

class ShortTextQuestionEntity extends QuestionEntity {
  ShortTextQuestionEntity({
    required super.questionId,
    required super.coordinates,
    required this.text,
    required this.validarionErrorMessage,
  });

  String text;
  String validarionErrorMessage;
}
