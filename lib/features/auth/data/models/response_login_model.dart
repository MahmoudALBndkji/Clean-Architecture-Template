import 'package:clean_architecture_template/features/auth/domain/entities/response_login_entity.dart';

class ResponseLoginModel extends ResponseLoginEntity {
  DataLoginModel? dataModel;
  String? message;
  bool? status;
  ResponseLoginModel({
    this.dataModel,
    this.message,
    this.status,
  }) : super(
          data: dataModel,
          message: message,
        );
  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) {
    return ResponseLoginModel(
      dataModel:
          json['Data'] != null ? DataLoginModel.fromJson(json['Data']) : null,
      message: json['Message'],
    );
  }
}

class DataLoginModel extends DataLoginEntity {
  final int? userID;
  final String? token;
  final String? message;

  DataLoginModel({
    this.userID,
    this.token,
    this.message,
  }) : super(message: message, token: token, userID: userID);

  factory DataLoginModel.fromJson(Map<String, dynamic> json) {
    return DataLoginModel(
      userID: json['UserID'],
      token: json['Token'],
      message: json['Message'],
    );
  }
}
