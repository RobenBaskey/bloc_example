import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'internet_bloc_event.dart';
part 'internet_bloc_state.dart';

class InternetBloc extends Bloc<InternetBlocEvent, InternetBlocState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  InternetBloc() : super(InternetBlocInitial()) {
    on<InternetLossEvent>((event, emit) {
      emit(InternetLossState());
    });

    on<InternetGainedEvent>((event, emit) {
      emit(InternetGainedState());
    });

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLossEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
