import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_service/di/injection_container.dart';
import 'package:pet_service/ui/choose_pet_widget.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';


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
                if (state is LoadedState) {
                  return Text(
                    "\$ ${state.cost}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (state is ErrorState) { //TODO(Show Error)
                  return Text(
                    state.message,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
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
                return ElevatedButton(
                  child: state is LoadingState
                      ? Container(
                          margin: const EdgeInsets.all(5),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text("Calculated Cost"),
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(
                      GetCalculatedCostEvent(
                        dogNights: 0,
                        isDogGrooming: false,
                        catNights: 0,
                        isCatGrooming: false,
                      ),
                    );
                  },
                );
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
