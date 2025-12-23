import 'package:clean_architecture_template/core/utils/typedef.dart';
import 'package:clean_architecture_template/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    List<DataModel>? data,
    PaginationModel? pagination,
  }) : super(data: data, pagination: pagination);

  UserModel copyWith({
    List<DataModel>? data,
    PaginationModel? pagination,
  }) {
    return UserModel(
      data: data ?? this.data as List<DataModel>?,
      pagination: pagination ?? this.pagination as PaginationModel?,
    );
  }

  factory UserModel.fromMap(DataMap map) {
    return UserModel(
      data: (map['data'] as List<dynamic>?)
          ?.map((e) => DataModel.fromMap(e as DataMap))
          .toList(),
      pagination: map['pagination'] != null
          ? PaginationModel.fromMap(map['pagination'] as DataMap)
          : null,
    );
  }

  DataMap toMap() => {
        'data': (data as List<DataModel>?)?.map((e) => e.toMap()).toList(),
        'pagination': (pagination as PaginationModel?)?.toMap(),
      };
}

class DataModel extends DataEntity {
  DataModel({
    super.id,
    super.email,
    super.username,
    NameModel? super.name,
    AddressModel? super.address,
    super.phone,
    super.orders,
  });

  DataModel copyWith({
    int? id,
    String? email,
    String? username,
    NameModel? name,
    AddressModel? address,
    String? phone,
    List<int>? orders,
  }) {
    return DataModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      name: name ?? this.name as NameModel?,
      address: address ?? this.address as AddressModel?,
      phone: phone ?? this.phone,
      orders: orders ?? this.orders,
    );
  }

  factory DataModel.fromMap(DataMap map) {
    return DataModel(
      id: map['id'] as int?,
      email: map['email'] as String?,
      username: map['username'] as String?,
      name: map['name'] != null
          ? NameModel.fromMap(map['name'] as DataMap)
          : null,
      address: map['address'] != null
          ? AddressModel.fromMap(map['address'] as DataMap)
          : null,
      phone: map['phone'] as String?,
      orders: (map['orders'] as List<dynamic>?)?.cast<int>(),
    );
  }

  DataMap toMap() => {
        'id': id,
        'email': email,
        'username': username,
        'name': (name as NameModel?)?.toMap(),
        'address': (address as AddressModel?)?.toMap(),
        'phone': phone,
        'orders': orders,
      };
}

class NameModel extends NameEntity {
  NameModel({
    super.firstname,
    super.lastname,
  });

  NameModel copyWith({
    String? firstname,
    String? lastname,
  }) {
    return NameModel(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
    );
  }

  factory NameModel.fromMap(DataMap map) {
    return NameModel(
      firstname: map['firstname'] as String?,
      lastname: map['lastname'] as String?,
    );
  }

  DataMap toMap() => {
        'firstname': firstname,
        'lastname': lastname,
      };
}

class AddressModel extends AddressEntity {
  AddressModel({
    super.street,
    super.city,
    super.zipcode,
    super.country,
  });

  AddressModel copyWith({
    String? street,
    String? city,
    String? zipcode,
    String? country,
  }) {
    return AddressModel(
      street: street ?? this.street,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      country: country ?? this.country,
    );
  }

  factory AddressModel.fromMap(DataMap map) {
    return AddressModel(
      street: map['street'] as String?,
      city: map['city'] as String?,
      zipcode: map['zipcode'] as String?,
      country: map['country'] as String?,
    );
  }

  DataMap toMap() => {
        'street': street,
        'city': city,
        'zipcode': zipcode,
        'country': country,
      };
}

class PaginationModel extends PaginationEntity {
  PaginationModel({
    super.page,
    super.limit,
    super.total,
  });

  PaginationModel copyWith({
    int? page,
    int? limit,
    int? total,
  }) {
    return PaginationModel(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      total: total ?? this.total,
    );
  }

  factory PaginationModel.fromMap(DataMap map) {
    return PaginationModel(
      page: map['page'] as int?,
      limit: map['limit'] as int?,
      total: map['total'] as int?,
    );
  }

  DataMap toMap() => {
        'page': page,
        'limit': limit,
        'total': total,
      };
}
