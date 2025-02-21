import 'package:flutter/material.dart';
import 'package:travel_bee/pages/main_home.dart';
import 'package:travel_bee/pages/packages_page.dart';
import 'package:travel_bee/providers/package_provider.dart';
import 'package:travel_bee/themes/color_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PurchaseDetailScreen extends ConsumerStatefulWidget {
  final String title;
  final String date;
  final String imageUrl;
  final double pricePerGuest;

  const PurchaseDetailScreen({
    super.key,
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.pricePerGuest,
  });

  @override
  _PurchaseDetailScreenState createState() => _PurchaseDetailScreenState();
}

class _PurchaseDetailScreenState extends ConsumerState<PurchaseDetailScreen> {
  int guestCount = 1;

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.pricePerGuest * guestCount;

    return Scaffold(
      // backgroundColor: Colors.pink[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Purchase detail",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(widget.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(widget.date,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Select Guests",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (guestCount > 1) {
                            setState(() => guestCount--);
                          }
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text("$guestCount Guests",
                          style: const TextStyle(fontSize: 16)),
                      IconButton(
                        onPressed: () => setState(() => guestCount++),
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total (Pkr)",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Pkr ${totalPrice.toStringAsFixed(3)}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationScreen(
                        title: widget.title,
                        date: widget.date,
                        guestCount: guestCount,
                        totalPrice: totalPrice,
                      ),
                    ),
                  );
                },
                child: const Text("Confirm",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ConfirmationScreen extends ConsumerWidget {
  final String title;
  final String date;
  final int guestCount;
  final double totalPrice;

  const ConfirmationScreen({
    super.key,
    required this.title,
    required this.date,
    required this.guestCount,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context, ref) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle,
                  color: ColorTheme.primaryColor, size: 50),
              const SizedBox(height: 10),
              const Text("Thank You!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const Text("Your purchase was successful"),
              const SizedBox(height: 20),
              Text("$title - $date"),
              Text("Guests: $guestCount"),
              Text("Total: Pkr ${totalPrice.toStringAsFixed(3)}",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const MainHome())),
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.primaryColor),
                child:
                    const Text("Close", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
