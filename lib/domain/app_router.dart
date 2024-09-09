import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
@AutoRouterConfig()
class AppRouter extends RootStackRouter {

 @override
 List<AutoRoute> get routes => [
   AutoRoute(page: QuranRoute.page),
   AutoRoute(page: SettingsRoute.page),
   AutoRoute(page: HomeRoute.page, initial: true),
   AutoRoute(page: CurrentSurahRoute.page),
 ];
}