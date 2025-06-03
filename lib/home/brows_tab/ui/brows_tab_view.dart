import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di.dart';
import 'package:movie_app/home/brows_tab/ui/category_details.dart';
import 'package:movie_app/home/brows_tab/ui/cubit/categories_cubit.dart';

class BrowsTabView extends StatelessWidget {
  final CategoriesCubit viewModel = getIt.get<CategoriesCubit>();
  BrowsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      bloc: viewModel..getCategoriesMovies(),
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return Container(
            margin: EdgeInsets.only(top: 20.h),
            color: const Color(0xff121312),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 8.w,bottom: 10.h),
                  child: Text(
                    "Browse Category",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white, fontSize: 25.sp),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 13.w),
                  child: GridView.builder(
                    itemCount: state.genresEntity.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, CategoryDetails.routName,
                              arguments: state.genresEntity[index]);
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Image.asset(state.images[index],
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.fill),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                state.genresEntity[index].name ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ))
              ],
            ),
          );
        } else if (state is CategoriesErrorState) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: Colors.white, fontSize: 25.sp),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
