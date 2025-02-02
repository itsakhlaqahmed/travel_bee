import 'package:flutter/material.dart';
import 'package:travel_bee/widgets/common/filter_list.dart';
import 'package:travel_bee/widgets/common/search_bar.dart';
import 'package:travel_bee/widgets/layout.dart';
import 'package:travel_bee/widgets/listing_page/list_card.dart';

class ListingPage extends StatelessWidget {
  ListingPage({super.key, this.listData});

  final List<String>? listData;

  final List<Map<String, String>> demoData = [
    {
      'imageUrl':
          'https://www.openislamabad.org/wp-content/uploads/2018/10/Pakistan-National-Monument-Islamabad-Pakistan-2635-2-1.jpg',
      'title': 'Islamabad',
      'description': 'The capital of Pakistan. A beautiful country. we love it',
    },
    {
      'imageUrl':
          'https://www.openislamabad.org/wp-content/uploads/2018/10/Pakistan-National-Monument-Islamabad-Pakistan-2635-2-1.jpg',
      'title': 'Islamabad',
      'description': 'The capital of Pakistan. A beautiful country. we love it',
    },
    {
      'imageUrl':
          'https://www.openislamabad.org/wp-content/uploads/2018/10/Pakistan-National-Monument-Islamabad-Pakistan-2635-2-1.jpg',
      'title': 'Islamabad',
      'description': 'The capital of Pakistan. A beautiful country. we love it',
    },
    {
      'imageUrl':
          'https://www.openislamabad.org/wp-content/uploads/2018/10/Pakistan-National-Monument-Islamabad-Pakistan-2635-2-1.jpg',
      'title': 'Islamabad',
      'description': 'The capital of Pakistan. A beautiful country. we love it',
    },
    {
      'imageUrl':
          'https://www.openislamabad.org/wp-content/uploads/2018/10/Pakistan-National-Monument-Islamabad-Pakistan-2635-2-1.jpg',
      'title': 'Islamabad',
      'description': 'The capital of Pakistan. A beautiful country. we love it',
    },
    {
      'imageUrl':
          'https://www.openislamabad.org/wp-content/uploads/2018/10/Pakistan-National-Monument-Islamabad-Pakistan-2635-2-1.jpg',
      'title': 'Islamabad',
      'description': 'The capital of Pakistan. A beautiful country. we love it',
    },
    {
      'imageUrl':
          'https://www.openislamabad.org/wp-content/uploads/2018/10/Pakistan-National-Monument-Islamabad-Pakistan-2635-2-1.jpg',
      'title': 'Islamabad',
      'description': 'The capital of Pakistan. A beautiful country. we love it',
    },
    {
      'imageUrl':
          'https://www.openislamabad.org/wp-content/uploads/2018/10/Pakistan-National-Monument-Islamabad-Pakistan-2635-2-1.jpg',
      'title': 'Islamabad',
      'description': 'The capital of Pakistan. A beautiful country. we love it',
    },
  ];

  @override
  Widget build(context) {
    const double cardHeight = 110;

    return Layout(
        child: Column(
      children: [
        SearchBarCustom(onChange: (a) {}),
        const SizedBox(
          height: 12,
        ),
        const FilterList(),
        const SizedBox(
          height: 24,
        ),
        ListView.builder(
          itemCount: demoData.length,
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(), // Disable ListView scrolling

          itemBuilder: (context, int index) {
            return Column(
              children: [
                ListCard(
                  cardHeight: cardHeight,
                  title: demoData[index]['title']!,
                  description: demoData[index]['description']!,
                  imageUrl: demoData[index]['imageUrl']!,
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            );
          },
        ),
      ],
    )
        // Column(
        //   children: [
        //     // ...demoData.map(
        //     //   (data) => Column(
        //     //     children: [
        //     //       ListCard(
        //     //         cardHeight: cardHeight,
        //     //         title: data['title']!,
        //     //         description: data['description']!,
        //     //         imageUrl: data['imageUrl']!,
        //     //       ),
        //     //       const SizedBox(
        //     //         height: 16,
        //     //       )
        //     //     ],
        //     //   ),
        //     // ),

        //   ],
        // ),
        );
  }
}
