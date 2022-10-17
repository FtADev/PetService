import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_service/clean_arc/features/service_cost/presentation/bloc/home/home_bloc.dart';
import 'package:pet_service/clean_arc/features/service_cost/presentation/bloc/home/home_event.dart';
import 'package:pet_service/clean_arc/features/service_cost/presentation/bloc/home/home_state.dart';
import 'package:pet_service/ui/choose_pet_widget.dart';

import '../di/injection_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Service"),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<HomeBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ChoosePetWidget(),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is Loaded) {
                  return Text(
                    "\$ ${state.cost}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return Container();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is Loading) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                  // } else if (state is Error) {
                  //   return _showToast(context);
                } else {
                  return ElevatedButton(
                    child: const Text("Calculated Cost"),
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context).add(
                        CalculateEvent(
                          dogNights: 0,
                          isDogGrooming: false,
                          catNights: 0,
                          isCatGrooming: false,
                        ),
                      );
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
