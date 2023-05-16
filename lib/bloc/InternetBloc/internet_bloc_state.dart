part of 'internet_bloc.dart';

@immutable
abstract class InternetBlocState {}

class InternetBlocInitial extends InternetBlocState {}

class InternetLossState extends InternetBlocState {}

class InternetGainedState extends InternetBlocState {}
