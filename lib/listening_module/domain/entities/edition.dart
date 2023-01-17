import 'package:equatable/equatable.dart';

class Edition extends Equatable{
  final String name;

  const Edition({
    required this.name,
});

  @override
  List<Object?> get props => [
    name,
  ];

}