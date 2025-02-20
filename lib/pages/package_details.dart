import 'package:flutter/material.dart';

class PackageDetailsPage extends StatelessWidget {
  final List<Map<String, String>> locations = [
    {
      "name": "Eiffel Tower",
      "image": "https://adventureplanners.net/wp-content/uploads/2021/04/22046822_1534122226631410_8854734913182488307_n-2.jpg",
      "description": "The heart of Paris with breathtaking views."
    },
    {
      "name": "Louvre Museum",
      "image": "https://adventureplanners.net/wp-content/uploads/2021/04/22046822_1534122226631410_8854734913182488307_n-2.jpg",
      "description": "Home to the Mona Lisa and other iconic artworks."
    },
    {
      "name": "Seine River",
      "image": "https://adventureplanners.net/wp-content/uploads/2021/04/22046822_1534122226631410_8854734913182488307_n-2.jpg",
      "description": "A romantic cruise through Paris awaits."
    },
    {
      "name": "Notre Dame",
      "image": "https://adventureplanners.net/wp-content/uploads/2021/04/22046822_1534122226631410_8854734913182488307_n-2.jpg",
      "description": "A historical masterpiece of Gothic architecture."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🌆 Header Image
            Stack(
              children: [
                Image.network(
                  "https://adventureplanners.net/wp-content/uploads/2021/04/22046822_1534122226631410_8854734913182488307_n-2.jpg",
                  width: double.infinity,
                  height: 280,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    "Tour of Ancient Paris",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // 📍 Journey Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Journey",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Over 10,000 visitors have enjoyed this trip."),
                  SizedBox(height: 16),

                  // 💲 Price & Duration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price for 7 Days",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "\$300",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // 🏙 Destination Locations
                  Text(
                    "Must-Visit Locations",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  _buildLocationCards(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🌍 Destination Cards List
  Widget _buildLocationCards() {
    return Column(
      children: locations.map((location) {
        return Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Image.network(
                  location["image"]!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location["name"]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        location["description"]!,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
