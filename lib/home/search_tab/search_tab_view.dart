import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app/core/custom-colors.dart';
import 'package:movie_app/core/di.dart';
import 'package:movie_app/home/search_tab/cubit/search_cubit.dart';
import 'package:movie_app/home/search_tab/widgets/movie_item.dart';

import '../home-tab/ui/widgets/movie_details.dart';

class SearchTabView extends StatefulWidget {
  SearchTabView({super.key});

  @override
  State<SearchTabView> createState() => _SearchTabViewState();
}

class _SearchTabViewState extends State<SearchTabView> {
  var viewModel = getIt.get<SearchCubit>();
  @override
  void initState() {
    super.initState();
    viewModel.getRecommendMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: viewModel.search,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1)),
                hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400),
                hintText: "search",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.r)),
                fillColor: CustomColors.primaryColor,
                filled: true,
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: BlocBuilder<SearchCubit, SearchState>(
            bloc: viewModel..filter(""),
            builder: (context, state) {
              if (state is SuccessState) {
                return Column(children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MovieDetails.routName,
                              arguments:
                                  state.recommendListMoviesEntity[index]);
                        },
                        child: MovieItem(
                          imagePath: state.recommendListMoviesEntity[index]
                                  .backdropPath ??
                              "",
                          name: state.recommendListMoviesEntity[index].title ??
                              "",
                          tagLine: state.recommendListMoviesEntity[index]
                                  .releaseDate ??
                              "",
                        ),
                      ),
                      itemCount: state.recommendListMoviesEntity.length,
                    ),
                  )
                ]);
              } else if (state is SearchInitial) {
                return Center(
                    child: Image.asset("Assets/images/moviesFound.png"));
              } else {
                return const Center(
                  child: Text("no data found"),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
