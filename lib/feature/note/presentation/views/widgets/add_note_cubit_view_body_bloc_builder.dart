import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/helpers/build_snack_bar.dart';
import 'package:nota/feature/note/presentation/manager/cubit/note_cubit.dart';
import 'package:nota/feature/note/presentation/views/widgets/add_new_note.dart';

class AddNoteViewBlocBuilder extends StatelessWidget {
  const AddNoteViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is NoteAdded) {
          buildSuccessSnackBar(context, message: 'note add Success');
        }
        if (state is NoteFaulire) {
          buildSuccessSnackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return AddNewNoteViewBody(
          isLoading: state is NoteLoading ? true : false,
        );
      },
    );
  }
}
