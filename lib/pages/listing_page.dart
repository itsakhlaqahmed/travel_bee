import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_bee/providers/hotel_provider.dart';
import 'package:travel_bee/widgets/common/filter_list.dart';
import 'package:travel_bee/widgets/common/search_bar.dart';
import 'package:travel_bee/widgets/layout.dart';
import 'package:travel_bee/widgets/listing_page/list_card.dart';

class ListingPage extends ConsumerStatefulWidget {
  const ListingPage({super.key, this.listData});

  final List<String>? listData;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ConsumerStatefulWidget> {
  final List<Map<String, String>> demoData = [
    {
      'imageUrl':
          'https://www.openislamabad.org/wp-content/uploads/2018/10/Pakistan-National-Monument-Islamabad-Pakistan-2635-2-1.jpg',
      'title': 'Islamabad',
      'description': 'The capital of Pakistan. A beautiful country. we love it',
    },
  ];

  @override
  Widget build(context) {
    final data = ref.watch(hotelProvider);
    const double cardHeight = 110;

    return Layout(
      child: Column(
        children: [
          SearchBarCustom(onChange: (a) {}),
          const SizedBox(
            height: 12,
          ),
          FilterList(
            (city) {},
          ),
          const SizedBox(
            height: 24,
          ),
          data.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
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
                      //  ListCard(
                      //   cardHeight: cardHeight,
                      //   title: data[index].name,
                      //   description: data[index].country,
                      //   imageUrl: data[index].imageUrl[0],
                      // ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  );
                },
              );
            },
            error: (error, stack) {
              print("************************************************");
              print(error);
              print(stack);
              return Text('error');
            },
            loading: () => Text('loading'),
          ),
        ],
      ),
    );
  }
}
