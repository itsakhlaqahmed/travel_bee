import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_bee/pages/checkout_page.dart';
import 'package:travel_bee/widgets/common/width_button.dart';
import 'package:travel_bee/widgets/packages_page/city_card_list.dart';

class PackageDetailsPage extends StatelessWidget {
  final String name;
  final String duration;
  final double price;
  final String startDate;
  final String endDate;
  final String image;
  // final name = '3 Days Hunza Package';
  // final duration = '7 Days';
  // final price = 19500;
  // final startDate = '20/02/2025';
  // final endDate = '25/02/2025';
  // final image =
  //     "https://adventureplanners.net/wp-content/uploads/2021/04/22046822_1534122226631410_8854734913182488307_n-2.jpg";

  const PackageDetailsPage({
    super.key,
    required this.name,
    required this.duration,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.image,
  });

  int _getTime() {
    return Random().nextInt(11) + 1;
  }

  _goToCheckOut(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => PurchaseDetailScreen(
              title: name,
              date: startDate,
              imageUrl: image,
              pricePerGuest: price.toDouble(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: 180,
            left: 20,
            child: Text(
              '${name.split(' ').sublist(0, 2).join(' ')}\n${name.split(' ').sublist(2).join(' ')}',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Journey Details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Top journey",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Over 10000 visitors",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Price for $duration",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                              Row(
                                children: [
                                  Text(
                                    "Rs. $price",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Journey Time
                      const Text("Journey time",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Starts",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text("${_getTime()}:00 AM",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text(startDate,
                                      style: const TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Ends",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text("${_getTime()}:00 PM",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text(endDate,
                                      style: const TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CityGrid(
                        cities: ['Karachi', 'Hyderabad'],
                      ),
                      const SizedBox(height: 48),
                      WidthButton(
                          text: 'Book Now',
                          onClick: () {
                            _goToCheckOut(context);
                          },
                          isLoading: false),
                      // Flight Details
                      // Container(
                      //   padding: const EdgeInsets.all(16),
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey.shade100,
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text("Airlines",
                      //           style: TextStyle(
                      //               color: Colors.orange,
                      //               fontWeight: FontWeight.bold)),
                      //       SizedBox(height: 8),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text("(IAH) USA - (ORY) Paris",
                      //                   style: TextStyle(
                      //                       fontWeight: FontWeight.bold)),
                      //               SizedBox(height: 4),
                      //               Text("6:30pm  →  1:00pm",
                      //                   style: TextStyle(fontSize: 12)),
                      //               Text("Arrival: Wed, Sep 11, 2024",
                      //                   style: TextStyle(
                      //                       color: Colors.grey, fontSize: 12)),
                      //             ],
                      //           ),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: [
                      //               Container(
                      //                 padding: const EdgeInsets.symmetric(
                      //                     horizontal: 12, vertical: 4),
                      //                 decoration: BoxDecoration(
                      //                   color: Colors.black,
                      //                   borderRadius: BorderRadius.circular(16),
                      //                 ),
                      //                 child: Text("Top journey",
                      //                     style: TextStyle(
                      //                         color: Colors.white,
                      //                         fontSize: 12)),
                      //               ),
                      //               SizedBox(height: 8),
                      //               Row(
                      //                 children: [
                      //                   Icon(Icons.attach_money,
                      //                       color: Colors.orange),
                      //                   Text("\$300",
                      //                       style: TextStyle(
                      //                           fontSize: 18,
                      //                           fontWeight: FontWeight.bold)),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
