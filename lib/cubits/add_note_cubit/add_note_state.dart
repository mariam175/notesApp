part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteCubitInitial extends AddNoteState {}

final class AddNoteCubitLoading extends AddNoteState {}

final class AddNoteCubitSuccess extends AddNoteState {}

final class AddNoteCubitFailure extends AddNoteState {
  final String error;
  AddNoteCubitFailure(this.error);
}
