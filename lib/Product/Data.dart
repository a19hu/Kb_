
class Product {
  const Product({ required this.id, required this.title, required this.price, required this.image });

  final String id;
  final String title;
  final int price;
  final String image;
}

const List<Product> allProducts = [
  Product(id: '1', title: 'Groovy Shorts', price: 12, image: 'Images/image.png'),
  Product(id: '2', title: 'Karati Kit', price: 34, image: 'Images/image.png'),
  Product(id: '3', title: 'Denim Jeans', price: 54, image: 'Images/image.png'),
  Product(id: '4', title: 'Red Backpack', price: 14, image: 'Images/image.png'),
  Product(id: '5', title: 'Drum & Sticks', price: 29, image: 'Images/image.png'),];