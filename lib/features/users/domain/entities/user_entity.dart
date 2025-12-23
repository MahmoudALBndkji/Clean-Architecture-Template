class UserEntity {
  List<DataEntity>? data;
  PaginationEntity? pagination;

  UserEntity({this.data, this.pagination});
}

class DataEntity {
  int? id;
  String? email;
  String? username;
  NameEntity? name;
  AddressEntity? address;
  String? phone;
  List<int>? orders;

  DataEntity(
      {this.id,
      this.email,
      this.username,
      this.name,
      this.address,
      this.phone,
      this.orders});
}

class NameEntity {
  String? firstname;
  String? lastname;

  NameEntity({this.firstname, this.lastname});
}

class AddressEntity {
  String? street;
  String? city;
  String? zipcode;
  String? country;

  AddressEntity({this.street, this.city, this.zipcode, this.country});
}

class PaginationEntity {
  int? page;
  int? limit;
  int? total;

  PaginationEntity({this.page, this.limit, this.total});
}
