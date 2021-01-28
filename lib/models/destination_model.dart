import 'package:hello_word_android_studio/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/kep1.jpg',
    name: 'Tevekenyseg1',
    type: 'Kirandulas',
    startTimes: ['9:00 ', '11:00 '],
    rating: 5,
    price: 3200,
  ),
  Activity(
    imageUrl: 'assets/images/kep2.jpg',
    name: 'Tevekenyseg2',
    type: 'Kirandulas',
    startTimes: ['10:00 ', '11:00 '],
    rating: 4,
    price: 2400,
  ),
  Activity(
    imageUrl: 'assets/images/kep3.png',
    name: 'Tevekenyseg3',
    type: 'Kirandulas',
    startTimes: ['19:00 ', '20:00 '],
    rating: 3,
    price: 3000,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/varos1.jpg',
    city: 'Varos1',
    country: 'Magyarorszag',
    description: 'Latogass el ide',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/varos2.jpg',
    city: 'Varos2',
    country: 'Magyarorszag',
    description: 'Latogass el ide',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/varos3.jpg',
    city: 'Varos3',
    country: 'Magyarorszag',
    description: 'Latogass el ide',
    activities: activities,
  )
];
