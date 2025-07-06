import 'package:equatable/equatable.dart';

class BranchGroup extends Equatable {
  final int id;
  final String name;

  const BranchGroup({required this.id, required this.name});

  @override
  List<Object?> get props => [id];
}
