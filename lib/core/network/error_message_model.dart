import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final int statusCode;
  final String status;
  final String message;

  const ErrorMessageModel({
    required this.statusCode,
    required this.status,
    required this.message,
});

  factory ErrorMessageModel.fromJson(Map<String,dynamic> json) => ErrorMessageModel(
      statusCode: json['code'],
      status: json['status'],
      message: json['message'],
  );



  @override
  List<Object?> get props => [
    statusCode,
    status,
    message,
  ];
}