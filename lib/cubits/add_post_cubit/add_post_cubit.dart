import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/post_model.dart';

part 'add_post_state.dart';

class AddNoteCubit extends Cubit<AddPostState> {
  AddNoteCubit() : super(AddPostInitial());

  Color color = const Color(0xffFE5F55);
  addNote(PostModel note) async {
    note.color = color.value;
    emit(AddPostLoading());
    try {
      var notesBox = Hive.box<PostModel>(kPostsBox);
      await notesBox.add(note);
      emit(AddPostSuccess());
    } catch (e) {
      emit(AddPostFailure(e.toString()));
    }
  }
}
