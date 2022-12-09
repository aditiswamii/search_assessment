import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:search_assessment/ui/bloc/home_cubit.dart';
import '../../core/core.dart';

class UserRepositoryScreen extends StatefulWidget {
  final String userName;
  const UserRepositoryScreen({Key? key, required this.userName})
      : super(key: key);

  @override
  UserRepositoryScreenState createState() => UserRepositoryScreenState();
}

class UserRepositoryScreenState extends State<UserRepositoryScreen> {
  late final HomeCubit _cubit;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return BlocProvider<HomeCubit>(
        create: (context) {
          _cubit = HomeCubit(context.read<CoreRepository>())
            ..userRepo(widget.userName);
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
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppTheme.appBlack,
                  iconTheme: IconThemeData(color: AppTheme.appWhite),
                  centerTitle: true,
                  elevation: 0.0,
                  title: Container(
                    margin: const EdgeInsets.only(right: 40),
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${widget.userName} Repository',
                      style: TextStyle(
                          color: AppTheme.appWhite,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontFamily: "Montserrat"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                body: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Stack(
                    children: [
                      BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                        if (state is HomeRepoSuccess) {
                          List<GetUserRepositoryList> getUserRepo =
                              state.response;
                          if (kDebugMode) {
                            print('response 3  $getUserRepo');
                            print('response 3  ${getUserRepo[0].name}');
                          }
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: getUserRepo.length,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return
                                Container(
                                width:
                                    MediaQuery.of(context).size.width,
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
                                      begin:
                                          AlignmentDirectional(-1, 0),
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
                                        margin:
                                            const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                        width: 80,
                                        height: 80,
                                        clipBehavior: Clip.antiAlias,
                                        decoration:
                                            const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          getUserRepo[index]
                                              .owner!
                                              .avatarUrl!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        getUserRepo[index].name!,style: TextStyle(color: AppTheme.appWhite,fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                        }
                        return const SizedBox.shrink();
                      })
                    ],
                  ),
                ))));
  }
}
