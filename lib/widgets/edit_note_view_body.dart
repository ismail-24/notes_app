import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_AppBar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const CustomAppBar(
            title: 'Edit',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(hint: 'Title', maxLines: 2),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(hint: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
