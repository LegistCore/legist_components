import 'package:legist_components/app/core/question_entity.dart';

class EmailQuestionEntity extends QuestionEntity {
  EmailQuestionEntity({
    required super.coordinates,
    required super.questionId,
    required this.number,
    required this.validationErrorMessage,
    required this.text,
  });

  String text;
  String number;
  String validationErrorMessage;  
}
