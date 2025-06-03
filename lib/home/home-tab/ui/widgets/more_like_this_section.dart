import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di.dart';
import 'package:movie_app/home/home-tab/ui/cubit/home_tab_view_model_cubit.dart';

import '../../../../core/custom-colors.dart';

class MoreLikeThisSection extends StatelessWidget {
  int id;
  final viewModel = getIt.get<HomeTabViewModelCubit>();
  MoreLikeThisSection({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModelCubit, HomeTabViewModelState>(
      bloc: viewModel..getMoreLikeThisMovies(id),
      builder: (context, state) {
        if (state is MoreLikeThisSuccessState) {
          return Container(
            margin: EdgeInsets.only(bottom: 10.h),
            height: 300.h,
            color: CustomColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    "More Like This",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 10.h),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(14.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(children: [
                                  Image.network(
                                    "https://image.tmdb.org/t/p/w300/${state.moreLikeThisEntity.results?[index].posterPath}",
                                    height: 200.h,
                                    width: 100.w,
                                    fit: BoxFit.fill,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset(
                                      "Assets/images/bookmark.png",
                                      height: 40.h,
                                      width: 25.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Row(
                                    children: [
                                      Image.asset("Assets/images/star.png"),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        state.moreLikeThisEntity.results?[index]
                                                .voteAverage
                                                .toString() ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  state.moreLikeThisEntity.results![index]
                                      .releaseDate
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    itemCount: state.moreLikeThisEntity.results?.length ?? 0,
                  ),
                )
              ],
            ),
          );
        } else if (state is ErrorState) {
          return Text(state.message,
              style: const TextStyle(color: Colors.white));
        } else {
          return Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.transparent,
              ),
            ),
          );
        }
      },
    );
  }
}
