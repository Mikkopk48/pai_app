
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SmallCard extends StatelessWidget {
  final List<dynamic> elementsList;
  final String route;
  

  const SmallCard({super.key, required this.elementsList, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: elementsList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final element = elementsList[index];
          return InkWell(
            onTap: () => context.push(route),
            child: Card(
              color: const Color(0xFFFFFFFF),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0,top: 17),
                      child: CircleAvatar(child: Icon(Icons.person)),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            element['name'],
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                element['location'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 18),
                              Text(element['stars'].toString()),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(element['degree']),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}