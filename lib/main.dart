import 'package:car_rental/core/data/car.dart';
import 'package:car_rental/feature/car_details/presentation/car_details_screen.dart';
import 'package:car_rental/feature/cars_list/presentation/car_list_screen.dart';
import 'package:car_rental/feature/onBoarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental',
      home: CarDetailsScreen(
        car: Car(
          model: "Fortuner GR",
          distance: 870,
          fuelCapacity: 50,
          pricePerHour: 45,
        ),
      ),
    );
  }
}
