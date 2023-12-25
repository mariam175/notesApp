import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes/notes_cubit.dart';
import 'package:notes/helpar/showsnake_bar.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/custom_text_field.dart';
import 'package:notes/widgets/edit_color_note.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).fetchNotes();
                showSnakBar(context, 'Succefully Edited', Colors.green);
              },
              title: 'Edit Notes',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              hint: widget.note.title,
              change: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              change: (value) {
                subTitle = value;
              },
              hint: widget.note.subTitle,
              maxLine: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            EditNoteColor(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}
