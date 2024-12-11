import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Витрина автомобилей',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class Car {
  final String name;
  final String shortDescription;
  final String longDescription;
  final String imagePath;

  Car({
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.imagePath,
  });
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cars = [
      Car(
        name: 'Tesla Model S',
        shortDescription: 'Электрический седан',
        longDescription:
        'Tesla Model S — это полноразмерный электромобиль, отличающийся большим запасом хода, быстрым разгоном и современной мультимедийной системой. Обладает просторным салоном, технологичной панелью приборов и системами автономного вождения.',
        imagePath: 'image/imagesss.jpeg',
      ),
      Car(
        name: 'BMW 3 Series',
        shortDescription: 'Спортивный седан',
        longDescription:
        'BMW 3 Series — один из самых популярных спорт-седанов в мире, сочетающий динамику, управляемость и комфорт. Модель обладает современным дизайном, интеллектуальными системами помощи водителю и высококачественным интерьером.',
        imagePath: 'image/images.jpg',
      ),
      Car(
        name: 'Mercedes-Benz G-Class',
        shortDescription: 'Внедорожник премиум-класса',
        longDescription:
        'Mercedes-Benz G-Class — это легендарный премиальный внедорожник с мощными двигателями, роскошным салоном и непревзойденными внедорожными характеристиками. Созданный с учётом традиций и качества бренда, он сочетает в себе брутальный внешний вид и последние технологические новинки.',
        imagePath: 'image/ss.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Витрина автомобилей'),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(car.name, style: const TextStyle(fontSize: 18)),
              subtitle: Text(car.shortDescription),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(car: car),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Car car;

  const DetailPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              car.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                car.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                car.longDescription,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
