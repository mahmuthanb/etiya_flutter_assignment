import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:etiya_flutter_assignment/controller/cubit/internet_cubit.dart';
import 'package:etiya_flutter_assignment/controller/cubit/movie_cubit.dart';
import 'package:etiya_flutter_assignment/controller/network.dart';
import 'package:etiya_flutter_assignment/view/movie_list.dart';
import 'package:etiya_flutter_assignment/view/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Connectivity connectivity = Connectivity();
    final NetworkService networkService = NetworkService();
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<MovieCubit>(
          create: (context) => MovieCubit(networkService: networkService),
        ),
      ],
      child: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state is InternetConnected &&
              state.connectivityResult != ConnectivityResult.none) {
            return const Scaffold(
              body: MovieList(),
            );
          } else if (state is InternetDisconnected) {
            return const InfoWidget(Icons.dangerous, "disconnected");
          }
          return const InfoWidget(Icons.info, "waiting internet connection");
        },
      ),
    );
  }
}
