import 'package:example/bloc/InternetBloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Internet")),
      body: Center(
          child: BlocConsumer<InternetBloc, InternetBlocState>(
        listener: (context, state) {
          if (state is InternetLossState) {
            print("loss");
          } else if (state is InternetGainedState) {
            print("gained");
          }
        },
        builder: (context, state) {
          if (state is InternetLossState) {
            return Text("Internet loss");
          } else if (state is InternetGainedState) {
            return Text("Internet Connected");
          } else {
            return Text("Loading...");
          }
        },
      )),
    );
  }
}
