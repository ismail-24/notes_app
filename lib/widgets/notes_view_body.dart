import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_AppBar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(),
        ],
      ),
    );
  }
}
