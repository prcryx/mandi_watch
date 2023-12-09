import 'package:kiwi/kiwi.dart';
import 'package:mandi_watch/data/repositories/home_repository.dart';
import 'package:mandi_watch/presentation/app/home/bloc/home_cubit.dart';
import 'package:mandi_watch/services/http/http_client.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static late KiwiContainer container;

  static void setUp() {
    container = KiwiContainer();
    final injector = _$InjectorConfig();
    injector._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureCubits();
    _configureRepositories();
    _configureServices();
  }

  /// Register Cubits
  @Register.factory(HomeCubit)
  void _configureCubits();

  /// Register Repositories
  @Register.factory(HomeRepository)
  void _configureRepositories();

  /// Register Services
  @Register.factory(HttpClient)
  void _configureServices();
}
