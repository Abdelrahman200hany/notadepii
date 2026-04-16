import 'package:dartz/dartz.dart';
import 'package:nota/core/errors/fauilre.dart';
import 'package:nota/feature/note/domain/entity/note_entity.dart';

abstract class NoteRepo {
  Stream<Either<Fauilre, List<NoteEntity>>> getAllNotes();

  Future<Either<Fauilre, void>> addNote({required NoteEntity note});
  Future<Either<Fauilre, void>> deleteNote({required String uID});
  Future<Either<Fauilre, void>> updateNote({
    required String uID,
    required NoteEntity note,
  });
}
