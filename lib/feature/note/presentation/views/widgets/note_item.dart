import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/feature/note/domain/entity/note_entity.dart';
import 'package:nota/feature/note/presentation/manager/cubit/note_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notesItem});

  final NoteEntity notesItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        notesItem.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        notesItem.subTitle,
        style: TextStyle(color: Colors.grey[600], fontSize: 14),
      ),
      trailing: IconButton(
        onPressed: () {
          context.read<NoteCubit>().deleteNote(uID: notesItem.uID);
        },
        icon: Icon(Icons.delete, color: Colors.red, size: 22),
      ),
    );
  }
}
