import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_bee/pages/hotel_details_page.dart';
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
  _onCardTap(hotel) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => HotelDetailPage(hotel: hotel),
      ),
    );
  }

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
                        title: data[index].name,
                        description: data[index].city,
                        imageUrl: data[index].imageUrl[0],
                        rating: data[index].rating!,
                        onTap: () {
                          _onCardTap(data[index]);
                        },
                      ),
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
