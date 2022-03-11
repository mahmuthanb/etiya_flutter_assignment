import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:etiya_flutter_assignment/data/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/cubit/internet_cubit.dart';
import 'view/widgets/info_widget.dart';
import 'view/home_page.dart';

void main() {
  runApp(const EtiyaFlutterAssignment());
}

class EtiyaFlutterAssignment extends StatelessWidget {
  const EtiyaFlutterAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Connectivity connectivity = Connectivity();
    return MaterialApp(
      title: 'ETIYA Flutter Assigment',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: connectivity),
          ),
        ],
        child: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state is InternetConnected &&
                state.connectivityResult != ConnectivityResult.none) {
              return const Scaffold(
                body: HomePage(),
              );
            } else if (state is InternetDisconnected) {
              return const InfoWidget(Icons.dangerous, "disconnected");
            }
            return const InfoWidget(Icons.info, "waiting internet connection");
          },
        ),
      ),
    );
  }
}
