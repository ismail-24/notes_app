import 'package:flutter/material.dart';
import 'package:notes_app/models/post_model.dart';
import 'package:notes_app/widgets/edit_note_view_body.dart';

class EditPostView extends StatelessWidget {
  const EditPostView({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditPostViewBody(
        post: post,
      ),
    );
  }
}
