import 'package:flutter/material.dart';
import 'package:nota/feature/note/domain/entity/note_entity.dart';
import 'package:nota/feature/note/presentation/views/widgets/note_item.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key, required this.notesList});

  final List<NoteEntity> notesList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notesList.length,
      itemBuilder: (context, index) => NoteItem(notesItem: notesList[index]),
    );
  }
}
