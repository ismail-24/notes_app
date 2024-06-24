import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/models/post_model.dart';
import 'package:notes_app/widgets/comment_template.dart';
import 'package:notes_app/widgets/post_component.dart';
import 'package:notes_app/widgets/profile_photo.dart';

class Comment {
  final String userName;
  final String commentText;

  Comment({required this.userName, required this.commentText});
}

class PostTemplet extends StatefulWidget {
  PostTemplet({super.key, required this.post});
  final PostModel post;

  @override
  State<PostTemplet> createState() => _PostTempletState();
}

class _PostTempletState extends State<PostTemplet> {
  bool writeComment = false;
  List<Comment> comments = [];
  TextEditingController? controller; // Declare the controller variable

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(); // Initialize the controller
  }

  void toggleWriteComment() {
    setState(() {
      writeComment = !writeComment;
    });
  }

  @override
  void dispose() {
    controller?.dispose(); // Dispose the controller when it's no longer needed
    super.dispose();
  }

  void addComment() {
    if (controller!.text.isNotEmpty) {
      setState(() {
        comments.add(
            Comment(userName: 'Yahia ahmed', commentText: controller!.text));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      margin: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
        color: Color(0x33E6EAFA),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const ProfilePhoto(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Yahia ahmed',
                        style: TextStyle(
                          color: Color(0xFF090F24),
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.post.date,
                        style: const TextStyle(
                          color: Color(0xFF848484),
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 210,
                ),
                SvgPicture.asset('assets/post_icons/menu.svg')
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.post.title,
              style: const TextStyle(
                color: Color(0xFF090F24),
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 3,
            ),
          ),
          const Divider(
            color: Color(0xFF848484),
            thickness: .3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PostComponent(
                  assetPath: 'assets/post_icons/love.svg',
                  title: 'Likes',
                ),
                GestureDetector(
                  onTap: () {
                    toggleWriteComment();
                  },
                  child: const PostComponent(
                    assetPath: 'assets/post_icons/comment.svg',
                    title: 'Comment',
                  ),
                ),
                const PostComponent(
                    assetPath: 'assets/post_icons/share.svg', title: 'Share'),
              ],
            ),
          ),
          Visibility(
            visible: writeComment,
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              padding: const EdgeInsets.only(left: 8),
              color: Colors.white,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write a comment',
                  hintStyle: TextStyle(
                    color: Color(0x7F848484),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return CommentTemplate(
                comment: comments[index].commentText,
              );
            },
          ),
          Visibility(
            visible: controller!.text.isNotEmpty,
            child: CommentTemplate(comment: controller!.text),
          ),
        ],
      ),
    );
  }
}
