import 'package:nota/feature/note/domain/entity/note_entity.dart';

class NoteModel {
  final String title;
  final String subTitle;
  final String uID;

  NoteModel({required this.title, required this.subTitle, required this.uID});

  /// from Entity → Model
  factory NoteModel.fromEntity(NoteEntity entity) {
    return NoteModel(
      title: entity.title,
      subTitle: entity.subTitle,
      uID: entity.uID,
    );
  }

  /// Model → Entity
  NoteEntity toEntity() {
    return NoteEntity(title: title, subTitle: subTitle, uID: uID);
  }

  /// from JSON
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'] ?? '',
      subTitle: json['subTitle'] ?? '',
      uID: json['uID'] ?? '',
    );
  }

  /// to JSON
  Map<String, dynamic> toJson() {
    return {'title': title, 'subTitle': subTitle, 'uID': uID};
  }
}
