import 'package:dartz/dartz.dart';
import 'package:nota/core/errors/fauilre.dart';
import 'package:nota/core/serviecs/data_base_services.dart';
import 'package:nota/feature/note/data/model/note_model.dart';
import 'package:nota/feature/note/domain/entity/note_entity.dart';
import 'package:nota/feature/note/domain/repo/note_repo.dart';

class NoteRepoImpt extends NoteRepo {
  final DataBaseServices dataBaseServices;

  NoteRepoImpt(this.dataBaseServices);

  final String path = "notes";

  @override
  Future<Either<Fauilre, void>> addNote({required NoteEntity note}) async {
    try {
      final model = NoteModel.fromEntity(note);

      await dataBaseServices.addData(
        path: path,
        data: model.toJson(),
        documentID: note.uID,
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: 'faild to add new note '));
    }
  }

  @override
  Future<Either<Fauilre, void>> deleteNote({required String uID}) async {
    try {
      await dataBaseServices.deleteData(path: path, documentID: uID);

      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: 'faild to delete a note '));
    }
  }

  @override
  Future<Either<Fauilre, List<NoteEntity>>> getAllNotes() async {
    try {
      final result = await dataBaseServices.readData(path: path);
      if (result == null || result.isEmpty) {
        return right([]); 
      }

      final notes = result
          .map((e) => NoteModel.fromJson(e).toEntity())
          .toList();

      return right(notes);
    } catch (e) {
      return left(ServerFailure(errorMessage: 'faild to get notes '));
    }
  }

  @override
  Future<Either<Fauilre, void>> updateNote({
    required String uID,
    required NoteEntity note,
  }) async {
    try {
      final model = NoteModel.fromEntity(note);

      await dataBaseServices.upDateData(
        path: path,
        documentID: uID,
        data: model.toJson(),
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: 'faild to upDate new note '));
    }
  }
}
