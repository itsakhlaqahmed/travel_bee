import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:excel/excel.dart';

void main() async {
  await Firebase.initializeApp();
  final firestore = FirebaseFirestore.instance;

  // Load Excel File
  var file = File('../../../../FYP Hamza/Copy of Pakistan_Cities_Travel_Data (Autosaved).xlsx');
  var bytes = file.readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  // Get first sheet
  var sheet = excel.tables.keys.first;
  var table = excel.tables[sheet];

  if (table == null) {
    print("Sheet not found!");
    return;
  }

  for (var row in table.rows.skip(1)) { // Skipping header row
    var bookData = {
      'title': row[0]?.value.toString() ?? '',
      'author': row[1]?.value.toString() ?? '',
      'genre': row[2]?.value.toString() ?? '',
      'publishedYear': int.tryParse(row[3]?.value.toString() ?? '0') ?? 0,
      'createdAt': FieldValue.serverTimestamp(),
    };

    await firestore.collection('books').add(bookData);
    print("Uploaded: ${bookData['title']}");
  }

  print("✅ Book data uploaded successfully!");
}
