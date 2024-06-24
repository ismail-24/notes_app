import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/posts_cubit/posts_cubit.dart';
import 'package:notes_app/models/post_model.dart';
import 'package:notes_app/widgets/custom_AppBar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_note_color_list.dart';

class EditPostViewBody extends StatefulWidget {
  const EditPostViewBody({super.key, required this.post});

  final PostModel post;

  @override
  State<EditPostViewBody> createState() => _EditPostViewBodyState();
}

class _EditPostViewBodyState extends State<EditPostViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.post.title = title ?? widget.post.title;
              widget.post.save();

              BlocProvider.of<PostsCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.post.title,
              maxLines: 2),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(
            note: widget.post,
          ),
        ],
      ),
    );
  }
}
