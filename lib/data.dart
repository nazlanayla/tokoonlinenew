class Product {
  final String name;
  final String price;
  final String quantity;
  final String image;
  final String description;

  Product(
    this.name,
    this.price,
    this.quantity,
    this.image,
    this.description,
  );
}

final List<Product> allData = [
  Product(
    'serum',
    '2.000',
    '2 pet',
    'assets/images/FOTO.1.jpg',
    'serum ini bagus untuk mengilangkan noda',
  ),
  Product(
    'skincare',
    '4.000',
    '2 botol',
    'assets/images/FOTO.2jpg',
    'skincare ini bagus untuk menghilangkan jerawat',
  ),
  Product(
    'make-up',
    '4.000',
    '2 botol',
    'assets/images/rj-skincare.jpg',
    'skincare ini bagus banget',
  ),
];
