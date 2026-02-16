import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';

class NavBarItemEntity {
  final String name;
  final String activeIcon;
  final String inActiveIcon;

  NavBarItemEntity({
    required this.name,
    required this.activeIcon,
    required this.inActiveIcon,
  });
}

List<NavBarItemEntity> get navBarItems => [
  NavBarItemEntity(
    name: 'الرئيسية',
    activeIcon: Assets.imagesNavBarIconsHomeActive,
    inActiveIcon: Assets.imagesNavBarIconsHome,
  ),
  NavBarItemEntity(
    name: 'المنتجات',
    activeIcon: Assets.imagesNavBarIconsCategoriesActive,
    inActiveIcon: Assets.imagesNavBarIconsCategories,
  ),
  NavBarItemEntity(
    name: 'السلة',
    activeIcon: Assets.imagesNavBarIconsCartActive,
    inActiveIcon: Assets.imagesNavBarIconsCart,
  ),
  NavBarItemEntity(
    name: 'أنا',
    activeIcon: Assets.imagesNavBarIconsUserActive,
    inActiveIcon: Assets.imagesNavBarIconsUser,
  ),
];
