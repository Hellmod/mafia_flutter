import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/home/block/home_bloc.dart';
import '../../presentation/home/view/home_page.dart';

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return MyHomePage();
        } else {
          return Container(child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
