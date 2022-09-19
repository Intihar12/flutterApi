class FilterSelectModal {
  String? message;
  String? status;
  Data? data;
  String? errors;

  FilterSelectModal({this.message, this.status, this.data, this.errors});

  FilterSelectModal.fromJson(Map<String, dynamic> json) {
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
  List<Company>? company;
  List<Individual>? individual;

  Data({this.company, this.individual});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['company'] != null) {
      company = <Company>[];
      json['company'].forEach((v) {
        company!.add(new Company.fromJson(v));
      });
    }
    if (json['individual'] != null) {
      individual = <Individual>[];
      json['individual'].forEach((v) {
        individual!.add(new Individual.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.company != null) {
      data['company'] = this.company!.map((v) => v.toJson()).toList();
    }
    if (this.individual != null) {
      data['individual'] = this.individual!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Company {
  Company? company;
  String? distance;
  String? totalRating;
  String? totalReviews;

  Company({this.company, this.distance, this.totalRating, this.totalReviews});

  Company.fromJson(Map<String, dynamic> json) {
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    distance = json['distance'];
    totalRating = json['total_rating'];
    totalReviews = json['total_reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['distance'] = this.distance;
    data['total_rating'] = this.totalRating;
    data['total_reviews'] = this.totalReviews;
    return data;
  }
}

class Companys {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? profileImage;
  String? businessAddress;
  String? description;

  Companys(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.profileImage,
        this.businessAddress,
        this.description});

  Companys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    profileImage = json['profileImage'];
    businessAddress = json['BusinessAddress'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['profileImage'] = this.profileImage;
    data['BusinessAddress'] = this.businessAddress;
    data['Description'] = this.description;
    return data;
  }
}

class Individual {
  Company? individual;
  String? distance;
  String? totalRating;
  String? totalReviews;

  Individual(
      {this.individual, this.distance, this.totalRating, this.totalReviews});

  Individual.fromJson(Map<String, dynamic> json) {
    individual = json['individual'] != null
        ? new Company.fromJson(json['individual'])
        : null;
    distance = json['distance'];
    totalRating = json['total_rating'];
    totalReviews = json['total_reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.individual != null) {
      data['individual'] = this.individual!.toJson();
    }
    data['distance'] = this.distance;
    data['total_rating'] = this.totalRating;
    data['total_reviews'] = this.totalReviews;
    return data;
  }
}
