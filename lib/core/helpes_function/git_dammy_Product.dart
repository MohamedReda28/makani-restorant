

import '../entitys/ProductEntity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Organic Apples',
    description: 'Fresh and delicious organic apples.',
    code: '12345',
    price: 9.99,
    //image: File(''),
    /// avgReting: 2.2,
    isFeature: true,
    catogry: 'berger',
    numberOfCaloric: 95,
    unitAmount: '1/4',
    reviews: [],
    isOrgnic: true,
    imageUrl: " ", avgReting: 0.0,
    ratigCount: 12, pID: '904jsmisncjdfd',
  );
}

List<ProductEntity> getDomyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
