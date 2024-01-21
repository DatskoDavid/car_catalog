import 'package:equatable/equatable.dart';

import '../../../domain/models/data.dart';

class DataState extends Equatable {
  final List<Data> data;

  const DataState({required this.data});

  DataState copyWith({List<Data>? data}) => DataState(data: data ?? this.data);

  @override
  List<Object?> get props => [data];
}
