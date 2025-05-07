import 'package:car_rental/core/data/car.dart';
import 'package:car_rental/core/routing/app_route.dart';
import 'package:car_rental/core/styeling/app_assets.dart';
import 'package:car_rental/feature/car_details/presentation/more_card.dart';
import 'package:car_rental/feature/cars_list/presentation/ui/car_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarDetailsScreen extends StatefulWidget {
  final Car car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_animationController!)..addListener(() {
      setState(() {});
    });
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info_outline), Text(" Information")],
        ),
      ),
      body: Column(
        children: [
          CarCard(car: widget.car),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(AppAssets.userImg),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Abraam Ibrahim",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$4,253', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).pushNamed(AppRoute.mapScreen, extra: widget.car);
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppAssets.mapsImg,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              MoreCard(
                car: Car(
                  model: "${widget.car.model}-1",
                  distance: "${widget.car.distance}100",
                  fuelCapacity: "${widget.car.fuelCapacity}100",
                  pricePerHour: "${widget.car.pricePerHour}10",
                ),
              ),
              SizedBox(height: 5),
              MoreCard(
                car: Car(
                  model: "${widget.car.model}-2",
                  distance: "${widget.car.distance}200",
                  fuelCapacity: "${widget.car.fuelCapacity}200",
                  pricePerHour: "${widget.car.pricePerHour}20",
                ),
              ),
              SizedBox(height: 5),
              MoreCard(
                car: Car(
                  model: "${widget.car.model}-3",
                  distance: "${widget.car.distance}300",
                  fuelCapacity: "${widget.car.fuelCapacity}300",
                  pricePerHour: "${widget.car.pricePerHour}30",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
