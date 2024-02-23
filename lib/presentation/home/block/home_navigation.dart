import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_bloc.dart';
import '../view/home_page.dart';

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return MyHomePage();
        } else {
          debugPrint("MPMP state else in HomeNavigator");
          return Container(child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
