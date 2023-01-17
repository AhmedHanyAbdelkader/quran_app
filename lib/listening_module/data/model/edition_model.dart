import 'package:quran_app/listening_module/domain/entities/edition.dart';

class EditionModel extends Edition{
  const EditionModel({
    required super.name,
  });

  factory EditionModel.fromJson(Map<String,dynamic> json) => EditionModel(
      name: json['name'],
  );

}