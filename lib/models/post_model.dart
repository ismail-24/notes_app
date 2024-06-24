import 'package:hive_flutter/adapters.dart';

part 'post_model.g.dart';

@HiveType(typeId: 0)
class PostModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  PostModel({
    required this.title,
    required this.date,
    required this.color,
  });
}
