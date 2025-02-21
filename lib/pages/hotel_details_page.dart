import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:travel_bee/models/hotel_model.dart';
import 'package:travel_bee/themes/color_theme.dart';
import 'package:travel_bee/themes/theme_layout.dart';
import 'package:travel_bee/widgets/details_page/details_card.dart';
import 'package:travel_bee/widgets/details_page/event_image_header.dart';
import 'package:travel_bee/widgets/layout.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailPage extends StatefulWidget {
  const HotelDetailPage({super.key, required this.hotel});
  final HotelModel hotel;

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  double _cardHeight = 0.0;
  final _cardKey = GlobalKey();

  Future<void> openMapWithAddress(String address) async {
    String encodedAddress =
        Uri.encodeComponent(address); // Encode spaces & special characters
    final Uri url = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$encodedAddress");

    if (!await launchUrl(url)) {
      throw 'Could not open the map.';
    }
  }

 

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;
    final double imageHeight = height * .4;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox =
          _cardKey.currentContext?.findRenderObject() as RenderBox;
      setState(() {
        _cardHeight = renderBox.size.height;
      });
    });

    List<Review> reviews = [
  Review(
    userName: "Casca Smith",
    userImage: "https://randomuser.me/api/portraits/men/1.jpg",
    rating: 4.5,
    timeAgo: "2d ago",
    reviewText: "Breathtaking views! The sunset here is absolutely magical.",
  ),
  Review(
    userName: "John Doe",
    userImage: "https://randomuser.me/api/portraits/men/2.jpg",
    rating: 5.0,
    timeAgo: "5d ago",
    reviewText: "A must-visit destination! The local culture is so rich and vibrant.",
  ),
  Review(
    userName: "Emily Johnson",
    userImage: "https://randomuser.me/api/portraits/women/3.jpg",
    rating: 4.8,
    timeAgo: "1w ago",
    reviewText: "Loved the historical sites! So much to explore and learn.",
  ),
  Review(
    userName: "Michael Lee",
    userImage: "https://randomuser.me/api/portraits/men/4.jpg",
    rating: 3.9,
    timeAgo: "3d ago",
    reviewText: "Great place, but very crowded during peak season.",
  ),
  Review(
    userName: "Sophia Martinez",
    userImage: "https://randomuser.me/api/portraits/women/5.jpg",
    rating: 4.7,
    timeAgo: "6d ago",
    reviewText: "The beaches were stunning! Crystal clear waters and soft sand.",
  ),
  Review(
    userName: "Daniel Brown",
    userImage: "https://randomuser.me/api/portraits/men/6.jpg",
    rating: 4.0,
    timeAgo: "2w ago",
    reviewText: "Nice place to relax, but food options were a bit limited.",
  ),
  Review(
    userName: "Olivia Wilson",
    userImage: "https://randomuser.me/api/portraits/women/7.jpg",
    rating: 5.0,
    timeAgo: "3w ago",
    reviewText: "Absolutely stunning architecture! Feels like stepping back in time.",
  ),
  Review(
    userName: "James Anderson",
    userImage: "https://randomuser.me/api/portraits/men/8.jpg",
    rating: 4.2,
    timeAgo: "1mo ago",
    reviewText: "Wonderful hiking trails with scenic views at every turn!",
  ),
];

    return Scaffold(
      body: Layout(
        enablePadding: false,
        topBar: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                print('click open map');
                print(widget.hotel.address);
                openMapWithAddress(widget.hotel.address ?? widget.hotel.city);
              },
              child: Stack(
                clipBehavior: Clip.none,
                // clipBehavior: Clip.,
                children: [
                  EventImageHeader(
                    imageHeight: imageHeight,
                    imageUrl: '${widget.hotel.imageUrl[0]} ',
                  ),
                  Positioned(
                    bottom: -50,
                    left: 0,
                    right: 0,
                    // child: Center(
                    child: DetailsCard(
                      key: _cardKey,
                      title: widget.hotel.name,
                      location: widget.hotel.city,
                      date: '20 July, 03:00 pm',
                      address: widget.hotel.address ?? widget.hotel.city,
                    ),
                    // ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _cardHeight / 2 + 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeLayout.edgeHorizontalPadding),
              // child: WidthButton(),
              child: AmenitiesWidget(),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeLayout.edgeHorizontalPadding),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.hotel.descripttion,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48,),
            ReviewCardList(reviews: reviews),
          ],
        ),
      ),
    );
  }
}

class AmenitiesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> amenities = [
    {"icon": Icons.king_bed, "label": "1 king bed"},
    {"icon": Icons.wifi, "label": "Free wi-fi"},
    {"icon": Icons.tv, "label": "TV"},
    {"icon": Icons.pool, "label": "Swimming Pool"},
    {"icon": Icons.restaurant, "label": "Restaurant"},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: amenities.map((amenity) {
        return Container(
          // width: 0,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:
                ColorTheme.primaryColor.withAlpha(80), // Light green background
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Icon(amenity["icon"], color: ColorTheme.primaryColor, size: 24),
              const SizedBox(height: 5),
              Text(
                amenity["label"],
                style: const TextStyle(
                    color: ColorTheme.primaryColor, fontSize: 12),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}



class Review {
  final String userName;
  final String userImage;
  final double rating;
  final String timeAgo;
  final String reviewText;

  Review({
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.timeAgo,
    required this.reviewText,
  });
}

class ReviewCardList extends StatelessWidget {
  final List<Review> reviews;

  const ReviewCardList({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Ensures it takes only required space
      physics: NeverScrollableScrollPhysics(), // Avoid nested scrolling issues
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Profile Image
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(review.userImage),
                ),
                SizedBox(width: 12),
                
                // Review Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            review.userName,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            PhosphorIcons.dotsThreeVertical(),
                            color: Colors.grey,
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      
                      // Rating and Time Ago
                      Row(
                        children: [
                          Icon(PhosphorIcons.star(), color: Colors.orange, size: 14),
                          SizedBox(width: 4),
                          Text(
                            '${review.rating}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Text(
                            review.timeAgo,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      
                      // Review Text
                      Text(
                        review.reviewText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
