part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteLoading extends NoteState {}

final class NoteDeleted extends NoteState {}

final class NoteUpdated extends NoteState {}

final class NoteAdded extends NoteState {}

final class NoteGetSuccess extends NoteState {
  final List<NoteEntity> notes;

  NoteGetSuccess({required this.notes});
}

final class NoteFaulire extends NoteState {
  final String errorMessage;

  NoteFaulire({required this.errorMessage});
}
