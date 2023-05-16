part of 'internet_bloc.dart';

@immutable
abstract class InternetBlocEvent {}

class InternetLossEvent extends InternetBlocEvent {}

class InternetGainedEvent extends InternetBlocEvent {}
