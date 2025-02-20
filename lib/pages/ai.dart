import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<String> convertImageToBase64(String imageUrl) async {
  try {
    // Fetch the image from the URL
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      // Convert response body (image bytes) to Base64
      Uint8List imageBytes = response.bodyBytes;
      String base64Image = base64Encode(imageBytes);
      return base64Image;
    } else {
      throw Exception("Failed to load image: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
    return "";
  }
}
