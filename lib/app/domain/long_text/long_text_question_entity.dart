import 'package:legist_components/app/core/question_entity.dart';

class LongTextQuestionEntity extends QuestionEntity {
  LongTextQuestionEntity({
    required super.questionId,
    required super.coordinates,
    required this.text,
    required this.validationErrorMessage,
  });

  String text;
  String validationErrorMessage;
}
