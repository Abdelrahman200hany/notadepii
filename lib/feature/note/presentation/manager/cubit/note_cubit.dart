import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nota/feature/note/domain/entity/note_entity.dart';
import 'package:nota/feature/note/domain/repo/note_repo.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this.noteRepo) : super(NoteInitial());

  final NoteRepo noteRepo;
  List<NoteEntity> notesList = [];

  ///  Get All Notes
  Future<void> getAllNotes() async {
    emit(NoteLoading());

    final result = await noteRepo.getAllNotes();

    result.fold(
      (failure) => emit(NoteFaulire(errorMessage: failure.errorMessage)),
      (notes) {
        notesList = notes;

        emit(NoteGetSuccess(notes: notes));
      },
    );
  }

  /// Add Note
  Future<void> addNote({required NoteEntity note}) async {
    emit(NoteLoading());

    final result = await noteRepo.addNote(note: note);

    result.fold(
      (failure) => emit(NoteFaulire(errorMessage: failure.errorMessage)),
      (_) => emit(NoteAdded()),
    );
  }

  ///  Delete Note
  Future<void> deleteNote({required String uID}) async {
    emit(NoteLoading());

    final result = await noteRepo.deleteNote(uID: uID);

    result.fold(
      (failure) => emit(NoteFaulire(errorMessage: failure.errorMessage)),
      (_) async {
        await getAllNotes();
      },
    );
  }

  ///  Update Note
  Future<void> updateNote({
    required String uID,
    required NoteEntity note,
  }) async {
    emit(NoteLoading());

    final result = await noteRepo.updateNote(uID: uID, note: note);

    result.fold(
      (failure) => emit(NoteFaulire(errorMessage: failure.errorMessage)),
      (_) => emit(NoteUpdated()),
    );
  }
}
