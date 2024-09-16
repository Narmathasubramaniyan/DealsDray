import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {}

class SplashInitial extends SplashEvent {
  @override
  List<Object?> get props => [];
}
