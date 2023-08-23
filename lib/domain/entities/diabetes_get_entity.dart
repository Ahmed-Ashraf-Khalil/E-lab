import 'package:equatable/equatable.dart';

class DiabetesGetEntity extends Equatable {
  final String result;

  const DiabetesGetEntity({required this.result});

  @override
  List<Object> get props => [
    result,
  ];
}