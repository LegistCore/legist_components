import 'package:legist_components/app/core/question_entity.dart';

class DateQuestionEntity extends QuestionEntity {
  DateQuestionEntity({
    required super.questionId,
    required super.coordinates,
    required this.maskPattern,
    required this.text,
    required this.validarionErrorMessage,
  });

  String text;
  String validarionErrorMessage;
  String maskPattern;
}
