// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../home/brows_tab/data/categories_repo_impl.dart' as _i678;
import '../home/brows_tab/data/categoris_data_source.dart' as _i65;
import '../home/brows_tab/domin/categories_use_case.dart' as _i1054;
import '../home/brows_tab/domin/category_repo_contract.dart' as _i305;
import '../home/brows_tab/ui/cubit/categories_cubit.dart' as _i965;
import '../home/home-tab/data/data_sources/data_source_contract.dart' as _i531;
import '../home/home-tab/data/data_sources/data_source_impl.dart' as _i729;
import '../home/home-tab/data/repository_impl/more_like_this_impl.dart'
    as _i333;
import '../home/home-tab/data/repository_impl/popular_movies_impl.dart'
    as _i403;
import '../home/home-tab/data/repository_impl/recommend_repo_impl.dart'
    as _i807;
import '../home/home-tab/data/repository_impl/upcoming_movies_impl.dart'
    as _i700;
import '../home/home-tab/domin/repository_contract/more_like_this_contract.dart'
    as _i551;
import '../home/home-tab/domin/repository_contract/popular_movies_contract.dart'
    as _i503;
import '../home/home-tab/domin/repository_contract/recommend_cotracat.dart'
    as _i931;
import '../home/home-tab/domin/repository_contract/upcoming_movies_contract.dart'
    as _i767;
import '../home/home-tab/domin/use_cases/more_like_this_uesCase.dart' as _i996;
import '../home/home-tab/domin/use_cases/popular_movies_useCase.dart' as _i689;
import '../home/home-tab/domin/use_cases/recommend_use_case.dart' as _i358;
import '../home/home-tab/domin/use_cases/upcoming_movies_useCase.dart' as _i829;
import '../home/home-tab/ui/cubit/home_tab_view_model_cubit.dart' as _i389;
import '../home/search_tab/cubit/search_cubit.dart' as _i1061;
import '../home/watchlist_tab/data/add_movies_repo_impl.dart' as _i1058;
import '../home/watchlist_tab/data/data-source/add_movies_contract.dart'
    as _i63;
import '../home/watchlist_tab/data/data-source/add_movies_impl.dart' as _i956;
import '../home/watchlist_tab/ui/cubit/add_movies_cubit.dart' as _i757;
import 'api-manger.dart' as _i174;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i174.ApiManger>(() => _i174.ApiManger());
    gh.singleton<_i65.CategoriesDataSource>(() => _i65.CategoriesDataSource());
    gh.factory<_i63.AddMoviesContract>(() => _i956.MoviesDao());
    gh.factory<_i305.CategoryRepoContract>(() => _i678.CategoriesRepoImpl(
        categoriesDataSource: gh<_i65.CategoriesDataSource>()));
    gh.factory<_i531.DataSourceContract>(
        () => _i729.DataSourceImpl(apiManger: gh<_i174.ApiManger>()));
    gh.factory<_i551.MoreLikeThisContract>(
        () => _i333.MoreLikeThisImpl(gh<_i531.DataSourceContract>()));
    gh.factory<_i1054.CategoriesUseCase>(() => _i1054.CategoriesUseCase(
        categoryRepoContract: gh<_i305.CategoryRepoContract>()));
    gh.factory<_i931.RecommendMoviesContract>(
        () => _i807.RecommendRepoImpl(gh<_i531.DataSourceContract>()));
    gh.factory<_i996.MoreLikeThisUseCase>(
        () => _i996.MoreLikeThisUseCase(gh<_i551.MoreLikeThisContract>()));
    gh.factory<_i358.RecommendUseCase>(() => _i358.RecommendUseCase(
        recommendMoviesContract: gh<_i931.RecommendMoviesContract>()));
    gh.factory<_i1058.AddMoviesRepoImpl>(
        () => _i1058.AddMoviesRepoImpl(gh<_i63.AddMoviesContract>()));
    gh.factory<_i757.AddMoviesCubit>(
        () => _i757.AddMoviesCubit(gh<_i1058.AddMoviesRepoImpl>()));
    gh.factory<_i503.PopularMoviesContract>(() => _i403.PopularMoviesImpl(
        dataSourceContract: gh<_i531.DataSourceContract>()));
    gh.factory<_i767.UpComingMoviesContract>(() => _i700.UpcomingMoviesImpl(
        dataSourceContract: gh<_i531.DataSourceContract>()));
    gh.factory<_i689.PopularMoviesUseCase>(() => _i689.PopularMoviesUseCase(
        popularMoviesContract: gh<_i503.PopularMoviesContract>()));
    gh.factory<_i829.UpComingMoviesUseCase>(() => _i829.UpComingMoviesUseCase(
        upComingMoviesContract: gh<_i767.UpComingMoviesContract>()));
    gh.factory<_i965.CategoriesCubit>(
        () => _i965.CategoriesCubit(gh<_i1054.CategoriesUseCase>()));
    gh.factory<_i1061.SearchCubit>(
        () => _i1061.SearchCubit(gh<_i358.RecommendUseCase>()));
    gh.factory<_i389.HomeTabViewModelCubit>(() => _i389.HomeTabViewModelCubit(
          popularMoviesUseCase: gh<_i689.PopularMoviesUseCase>(),
          upComingMoviesUseCase: gh<_i829.UpComingMoviesUseCase>(),
          recommendUseCase: gh<_i358.RecommendUseCase>(),
          moreLikeThisUseCase: gh<_i996.MoreLikeThisUseCase>(),
        ));
    return this;
  }
}
