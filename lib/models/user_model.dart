import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String job;

  UserModel({
    required this.id, 
    required this.email, 
    required this.name, 
    this.job = '',
    });

  @override
  List<Object?> get props => [id, name, email, job];
}
