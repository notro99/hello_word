class Hotel{
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
   this.imageUrl,
   this.name,
   this.address,
   this.price,
});
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel 1',
    address: 'Varos utca hazszam',
    price: 12000,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Hotel 2',
    address: 'Varos utca hazszam',
    price: 10000,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel3.jpg',
    name: 'Hotel 3',
    address: 'Varos utca hazszam',
    price: 23000,
  ),
];