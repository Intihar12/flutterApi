class MyAppointmentModal {
  String? message;
  String? status;
  Data? data;
  String? errors;

  MyAppointmentModal({this.message, this.status, this.data, this.errors});

  MyAppointmentModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = this.errors;
    return data;
  }
}

class Data {
  List<UpcommingBookings>? upcommingBookings;
  List<PastBookings>? pastBookings;

  Data({this.upcommingBookings, this.pastBookings});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['upcomming_bookings'] != null) {
      upcommingBookings = <UpcommingBookings>[];
      json['upcomming_bookings'].forEach((v) {
        upcommingBookings!.add(new UpcommingBookings.fromJson(v));
      });
    }
    if (json['past_bookings'] != null) {
      pastBookings = <PastBookings>[];
      json['past_bookings'].forEach((v) {
        pastBookings!.add(new PastBookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.upcommingBookings != null) {
      data['upcomming_bookings'] =
          this.upcommingBookings!.map((v) => v.toJson()).toList();
    }
    if (this.pastBookings != null) {
      data['past_bookings'] =
          this.pastBookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpcommingBookings {
  int? bookingId;
  String? seller;
  String? dateTime;
  String? bookingStatus;
  String? image;

  UpcommingBookings(
      {this.bookingId,
        this.seller,
        this.dateTime,
        this.bookingStatus,
        this.image});

  UpcommingBookings.fromJson(Map<String, dynamic> json) {
    bookingId = json['BookingId'];
    seller = json['Seller'];
    dateTime = json['DateTime'];
    bookingStatus = json['bookingStatus'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BookingId'] = this.bookingId;
    data['Seller'] = this.seller;
    data['DateTime'] = this.dateTime;
    data['bookingStatus'] = this.bookingStatus;
    data['image'] = this.image;
    return data;
  }
}

class PastBookings {
  int? bookingId;
  String? seller;
  String? dateTime;
  String? bookingStatus;
  String? image;

  PastBookings(
      {this.bookingId,
        this.seller,
        this.dateTime,
        this.bookingStatus,
        this.image});

  PastBookings.fromJson(Map<String, dynamic> json) {
    bookingId = json['BookingId'];
    seller = json['Seller'];
    dateTime = json['DateTime'];
    bookingStatus = json['bookingStatus'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BookingId'] = this.bookingId;
    data['Seller'] = this.seller;
    data['DateTime'] = this.dateTime;
    data['bookingStatus'] = this.bookingStatus;
    data['image'] = this.image;
    return data;
  }
}
