
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/helpers/build_snack_bar.dart';
import 'package:nota/feature/note/presentation/manager/cubit/note_cubit.dart';
import 'package:nota/feature/note/presentation/views/widgets/note_view_body.dart';

class NoteViewBodyBlocListener extends StatelessWidget {
  const NoteViewBodyBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is NoteFaulire) {
          buildErrorSnackBar(context, message: state.errorMessage);
        }
      },
      child: const NoteViewBody(),
    );
  }
}
