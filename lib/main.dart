import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_e_commerce_app/core/cubits/locale_cubit/locale_cubit.dart';
import 'package:fruits_e_commerce_app/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:fruits_e_commerce_app/core/routing/router_generation_config.dart';
import 'package:fruits_e_commerce_app/core/services/cahce_helper.dart';
import 'package:fruits_e_commerce_app/core/services/get_it_service.dart';
import 'package:fruits_e_commerce_app/core/services/observer.dart';
import 'package:fruits_e_commerce_app/core/services/push_notification_service.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce_app/features/favorites/domain/repos/favorites_repo.dart';
import 'package:fruits_e_commerce_app/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:fruits_e_commerce_app/firebase_options.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  setupGetIt();
  await getIt<PushNotificationService>().init();
  await dotenv.load();
  Bloc.observer = AppBlocObserver();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
          create: (context) =>
              FavoritesCubit(favoritesRepo: getIt<FavoritesRepo>())
                ..getFavoriteProducts(),
        ),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LocaleCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp.router(
                builder: EasyLoading.init(),
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: locale,
                supportedLocales: S.delegate.supportedLocales,
                routerConfig: RouterGenerationConfig.goRouter,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
