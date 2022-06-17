import 'package:legist_components/app/core/question_entity.dart';

class PhoneQuestionEntity extends QuestionEntity {
  PhoneQuestionEntity({
    required super.questionId,
    required super.coordinates,
    required this.maskPattern,
    required this.number,
    required this.text,
  });

  String text;
  String number;
  String maskPattern;
}
