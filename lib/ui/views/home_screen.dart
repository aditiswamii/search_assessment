import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_assessment/core/core.dart';
import 'package:search_assessment/ui/widget/widget.dart';

import '../bloc/home_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late final HomeCubit _cubit;

  @override
  void dispose() {
   _cubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) {
        _cubit = HomeCubit(context.read<CoreRepository>());
        // _cubit.getProfile();
        return _cubit;
      },
      child: BlocListener<HomeCubit,HomeState>(
        listener: (context, state) {
          if (state is HomeLoading) {

          }

          if (state is HomeError) {

          }
        },
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    color: AppTheme.appBlack,
                    child: SearchBarWidget(
                      bodyMargin: MediaQuery.of(context).size.width * 0.07,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 70),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
