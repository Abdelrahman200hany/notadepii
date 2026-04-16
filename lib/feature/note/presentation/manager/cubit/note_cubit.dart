import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nota/feature/note/domain/entity/note_entity.dart';
import 'package:nota/feature/note/domain/repo/note_repo.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this.noteRepo) : super(NoteInitial());
  @override
  Future<void> close() {
    _notesSub?.cancel();
    return super.close();
  }

  final NoteRepo noteRepo;
  List<NoteEntity> notesList = [];
  StreamSubscription? _notesSub;

  void getAllNotes() {
    _notesSub?.cancel();

    emit(NoteLoading());

    _notesSub = noteRepo.getAllNotes().listen((result) {
      result.fold(
        (failure) => emit(NoteFaulire(errorMessage: failure.errorMessage)),
        (notes) {
          notesList = notes;
          emit(NoteGetSuccess(notes: notes));
        },
      );
    });
  }

  ///  Get All Notes for not stream data
  // Future<void> getAllNotes() async {
  //   emit(NoteLoading());

  //   final result = await noteRepo.getAllNotes();

  //   result.fold(
  //     (failure) => emit(NoteFaulire(errorMessage: failure.errorMessage)),
  //     (notes) {
  //       notesList = notes;

  //       emit(NoteGetSuccess(notes: notes));
  //     },
  //   );
  // }

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
      (_) => emit(NoteDeleted()),
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
