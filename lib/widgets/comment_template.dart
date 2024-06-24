import 'package:flutter/material.dart';

class CommentTemplate extends StatelessWidget {
  const CommentTemplate({super.key, required this.comment});
  final String comment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 70,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          const Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: Image(
                  image: AssetImage(
                    'assets/post_icons/Avatar.png',
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Yahia ahmed',
                style: TextStyle(
                  color: Color(0xFF090F24),
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 8),
            child: Text(
              comment,
              style: const TextStyle(
                color: Color(0xFF090F24),
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
