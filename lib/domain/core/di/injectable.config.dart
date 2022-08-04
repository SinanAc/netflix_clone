// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/downloads_bloc.dart' as _i9;
import '../../../application/fast_laugh/fast_laugh_bloc.dart' as _i10;
import '../../../application/home/home_bloc.dart' as _i11;
import '../../../application/new_hot/new_hot_bloc.dart' as _i12;
import '../../../application/search/search_bloc.dart' as _i13;
import '../../../infrastructure/downloads/downloads_repo.dart' as _i4;
import '../../../infrastructure/new_hot/hot_new_repo.dart' as _i6;
import '../../../infrastructure/search/search_repo.dart' as _i8;
import '../../downloads/i_downloads_repo.dart' as _i3;
import '../../new_hot/i_new_hot_repo.dart' as _i5;
import '../../search/i_search_repo.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IDownloadsRepo>(() => _i4.DownloadsRepo());
  gh.lazySingleton<_i5.NewHotService>(() => _i6.NewHotRepo());
  gh.lazySingleton<_i7.SearchService>(() => _i8.SearchRepo());
  gh.factory<_i9.DownloadsBloc>(
      () => _i9.DownloadsBloc(get<_i3.IDownloadsRepo>()));
  gh.factory<_i10.FastLaughBloc>(
      () => _i10.FastLaughBloc(get<_i3.IDownloadsRepo>()));
  gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(get<_i5.NewHotService>()));
  gh.factory<_i12.NewHotBloc>(() => _i12.NewHotBloc(get<_i5.NewHotService>()));
  gh.factory<_i13.SearchBloc>(() =>
      _i13.SearchBloc(get<_i3.IDownloadsRepo>(), get<_i7.SearchService>()));
  return get;
}
