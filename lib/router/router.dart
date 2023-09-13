import 'package:auto_route/auto_route.dart';
import 'package:yandex_map_parking_layer_test/features/get_tile/presentation/screens/splash_screen.dart';
import 'package:yandex_map_parking_layer_test/features/get_tile/presentation/screens/tile_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: TileRoute.page),
      ];
}
