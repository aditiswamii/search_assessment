import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:search_assessment/core/core.dart';
import 'package:search_assessment/ui/views/user_repo_sort.dart';
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
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }

          if (state is HomeError) {}
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
                      onTap: (String value) {
                        if (value.isNotEmpty) {
                          _cubit.searchUser(text: value);
                        }
                      },
                      onTapClose: (bool value) {
                        _cubit.searchUser(text: "");
                      },
                    )),
                BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                  if (state is HomeSearchSuccess) {
                    UserListResponse userListResponse = state.response;
                    return userListResponse.items != null
                        ? Container(
                            margin: const EdgeInsets.only(top: 70),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: userListResponse.items!.length,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  UserRepositoryScreen(
                                                    userName: userListResponse
                                                        .items![index].login!,
                                                  )));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.all(10) ,
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 0),
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFcdcbcc),
                                              Color(0xFF40343c)
                                            ],
                                            stops: [0, 1],
                                            begin: AlignmentDirectional(-1, 0),
                                            end: AlignmentDirectional(1, 0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    -1, 0),
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  10, 0, 10, 0),
                                              width: 80,
                                              height: 80,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                userListResponse
                                                    .items![index].avatarUrl!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              userListResponse
                                                  .items![index].login!,style: TextStyle(color: AppTheme.appWhite,fontSize: 16)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 90),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/empty_box.png',
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Icon(Icons.empty),
                                const Text(
                                  'No Data Available',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                  }
                  return Container(
                    margin: const EdgeInsets.only(top: 90),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/empty_box.png',
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Icon(Icons.empty),
                        const Text(
                          'No Data Available',
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
