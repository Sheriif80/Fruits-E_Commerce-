import 'package:fruits_e_commerce_app/core/repos/order_repos/order_repo.dart';
import 'package:fruits_e_commerce_app/core/repos/order_repos/order_repo_impl.dart';
import 'package:fruits_e_commerce_app/core/repos/products_repo/products_repo.dart';
import 'package:fruits_e_commerce_app/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruits_e_commerce_app/core/services/database_service.dart';
import 'package:fruits_e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_e_commerce_app/core/services/firestore_service.dart';
import 'package:fruits_e_commerce_app/core/services/push_notification_service.dart';
import 'package:fruits_e_commerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:fruits_e_commerce_app/features/favorites/domain/repos/favorites_repo.dart';
import 'package:fruits_e_commerce_app/features/products/data/repos/reviews_repo_impl.dart';
import 'package:fruits_e_commerce_app/features/products/domain/repos/reviews_repo.dart';
import 'package:fruits_e_commerce_app/features/search/data/repos/search_repo_impl.dart';
import 'package:fruits_e_commerce_app/features/search/domain/repos/search_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<PushNotificationService>(PushNotificationService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(databaseService: getIt<DatabaseService>()),
  );

  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpl(databaseService: getIt<DatabaseService>()),
  );

  getIt.registerSingleton<ReviewsRepo>(
    ReviewsRepoImpl(databaseService: getIt<DatabaseService>()),
  );

  getIt.registerLazySingleton<FavoritesRepo>(() => FavoritesRepoImpl());

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(databaseService: getIt<DatabaseService>()),
  );
}
