import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/custom-colors.dart';
import 'package:movie_app/home/home-screen/home_screen_view_model_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatefulWidget {
  static const String routName = "home screen view";

  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final viewModel = HomeScreenViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeScreenViewModelCubit, HomeScreenViewModelState>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xff121312),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: const Color(0xffFFBB3B),
                unselectedItemColor: const Color(0xffC6C6C6),
                currentIndex: viewModel.currentIndex,
                onTap: (index) {
                  viewModel.changeTabs(index);
                },
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: const Color(0xff1A1A1A),
                      icon: ImageIcon(
                          size: 30.w,
                          const AssetImage(
                            "Assets/images/homeIcon2.png",
                          )),
                      label: "home"),
                  BottomNavigationBarItem(
                      backgroundColor: const Color(0xff1A1A1A),
                      icon: ImageIcon(
                          size: 30.w,
                          const AssetImage("Assets/images/search-2.png")),
                      label: "search"),
                  BottomNavigationBarItem(
                      backgroundColor: const Color(0xff1A1A1A),
                      icon: ImageIcon(
                          size: 30.w,
                          const AssetImage(
                              "Assets/images/Icon material-movie.png")),
                      label: "brows"),
                  BottomNavigationBarItem(
                      backgroundColor: const Color(0xff1A1A1A),
                      icon: ImageIcon(
                          size: 30.w,
                          const AssetImage(
                            "Assets/images/Icon-bookmarks.png",
                          )),
                      label: "watchlist"),
                ]),
            body: viewModel.screens[viewModel.currentIndex],
          );
        },
      ),
    );
  }
}
