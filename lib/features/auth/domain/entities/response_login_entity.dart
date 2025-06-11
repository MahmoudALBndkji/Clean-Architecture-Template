class ResponseLoginEntity {
  DataLoginEntity? data;
  String? message;
  ResponseLoginEntity({this.data, this.message});
}

class DataLoginEntity {
  final int? userID;
  final String? token;
  final String? message;
  DataLoginEntity({this.userID, this.token, this.message});
}
