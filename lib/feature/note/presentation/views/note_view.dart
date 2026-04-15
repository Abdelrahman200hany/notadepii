import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/serviecs/setup_services_locator.dart';
import 'package:nota/feature/note/domain/repo/note_repo.dart';
import 'package:nota/feature/note/presentation/manager/cubit/note_cubit.dart';
import 'package:nota/feature/note/presentation/views/widgets/note_view_body_bloc_listener.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  static const routeName = 'NoteView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(getIt.get<NoteRepo>()),
      child: const NoteViewBodyBlocListener(),
    );
  }
}
