enum BookingStatus { pending, confirmed, canceled }

extension BookingStatusExtension on BookingStatus {
  String get value {
    switch (this) {
      case BookingStatus.pending:
        return 'pending';
      case BookingStatus.confirmed:
        return 'confirmed';
      case BookingStatus.canceled:
        return 'canceled';
    }
  }

  static BookingStatus fromString(String status) {
    switch (status) {
      case 'confirmed':
        return BookingStatus.confirmed;
      case 'canceled':
        return BookingStatus.canceled;
      default:
        return BookingStatus.pending;
    }
  }
}

class BookingModel {
  final String id;
  final String userId;
  final String hotelId;
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final int guests;
  final double totalPrice;
  final BookingStatus status;

  BookingModel({
    required this.id,
    required this.userId,
    required this.hotelId,
    this.checkInDate,
    this.checkOutDate,
    required this.guests,
    required this.totalPrice,
    required this.status,
  });

  factory BookingModel.fromFirestore(Map<String, dynamic> data, String id) {
    return BookingModel(
      id: id,
      userId: data['userId'],
      hotelId: data['hotelId'],
      // checkInDate: (data['checkInDate'] as Timestamp).toDate(),
      // checkOutDate: (data['checkOutDate'] as Timestamp).toDate(),
      guests: data['guests'],
      totalPrice: data['totalPrice'].toDouble(),
      status: BookingStatusExtension.fromString(data['status']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'hotelId': hotelId,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'guests': guests,
      'totalPrice': totalPrice,
      'status': status.value,
    };
  }
}
