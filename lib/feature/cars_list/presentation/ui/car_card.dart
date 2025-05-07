import 'package:car_rental/core/data/car.dart';
import 'package:car_rental/core/routing/app_route.dart';
import 'package:car_rental/core/styeling/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(AppRoute.carDetailsScreen, extra: car);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
          ],
        ),
        child: Column(
          children: [
            Image.asset(AppAssets.carImage, height: 120),
            Text(
              car.model,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(AppAssets.gpsImg),
                        Text("${car.distance}km"),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(AppAssets.pumpImg),
                        Text(' ${car.fuelCapacity}L'),
                      ],
                    ),
                  ],
                ),
                Text('\$${car.pricePerHour}/h', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
