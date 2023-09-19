import '../../domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
      answer: json['answer'], forced: json['forced'], image: json['image']);

// Esto es lo que al final devuelvo en el chat
  Message toMessaEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image);
}
