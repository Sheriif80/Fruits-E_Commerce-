import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() => ProductEntity(
  code: "1234",
  name: "Apple",
  description: "A delicious apple",
  price: 10.99,
  isFeatured: true,
  imageURL: "https://example.com/apple.jpg",
  expiryDateMonths: 3,
  isOrganic: true,
  numberOfCalories: 100,
  unitAmount: 1,
  avgRating: 4.5,
  numberOfRatings: 10,
);

List<ProductEntity> getDummyProducts() =>
    List.generate(10, (index) => getDummyProduct());
