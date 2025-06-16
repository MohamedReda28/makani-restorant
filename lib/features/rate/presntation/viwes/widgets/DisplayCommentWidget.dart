import 'package:flutter/material.dart';

class ReviewItemWidget extends StatelessWidget {
  final String name;
  final String date;
  final String avatarUrl;
  final double rating;
  final String comment;

  const ReviewItemWidget({
    super.key,
    required this.name,
    required this.date,
    required this.avatarUrl,
    required this.rating,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                    radius: 28,
                  ),
                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style:
                      const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      comment,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Color(0xFF444444),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
