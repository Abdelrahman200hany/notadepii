import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/serviecs/setup_services_locator.dart';
import 'package:nota/feature/note/domain/repo/note_repo.dart';
import 'package:nota/feature/note/presentation/manager/cubit/note_cubit.dart';
import 'package:nota/feature/note/presentation/views/widgets/add_note_cubit_view_body_bloc_builder.dart';

class AddNewNoteView extends StatelessWidget {
  const AddNewNoteView({super.key});
  static const routeName = 'AddNewNoteView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(getIt.get<NoteRepo>()),
      child:const AddNoteViewBlocBuilder(),
    );
  }
}
