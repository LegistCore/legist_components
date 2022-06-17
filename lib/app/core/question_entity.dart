import 'package:legist_components/app/core/coordinates_entity.dart';

abstract class QuestionEntity {
  QuestionEntity({
    required this.questionId,
    required this.coordinates,
  });
  int questionId;
  CoordinatesEntity coordinates;
}
