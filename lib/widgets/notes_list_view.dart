import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/posts_cubit/posts_cubit.dart';
import 'package:notes_app/models/post_model.dart';
import 'package:notes_app/widgets/post_templet.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        List<PostModel> posts =
            BlocProvider.of<PostsCubit>(context).posts ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: posts.length,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: PostTemplet(
                  post: posts[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
