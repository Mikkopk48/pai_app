

import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({
    super.key,
    required this.reviewsList,
  });

  final List reviewsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: reviewsList.length,
        itemBuilder: (context, index) {
          final review = reviewsList[index];
          return Card(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.account_circle_rounded),
                        Text(
                          review['fromWho'],
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Spacer(),
                        PopupMenuButton<String>(
                          onSelected: (String value) {},
                          itemBuilder: (BuildContext context) => [
                            const PopupMenuItem<String>(
                              value: 'report',
                              child: Text('Marcar como inapropiada'),
                            ),
                          ],
                          icon: const Icon(Icons.more_vert),
                        )
                      ],
                    ),
                    Text(review['text'],
                        maxLines: 3, overflow: TextOverflow.ellipsis),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(review['stars'],
                            maxLines: 3, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
