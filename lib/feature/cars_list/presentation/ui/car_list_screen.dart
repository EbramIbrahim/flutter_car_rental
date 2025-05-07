import 'package:car_rental/core/data/car.dart';
import 'package:car_rental/feature/cars_list/presentation/bloc/car_list_bloc.dart';
import 'package:car_rental/feature/cars_list/presentation/bloc/car_list_event.dart';
import 'package:car_rental/feature/cars_list/presentation/bloc/car_list_state.dart';
import 'package:car_rental/feature/cars_list/presentation/ui/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatefulWidget {
  const CarListScreen({super.key});

  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  void initState() {
    context.read<CarListBloc>().add(LoadCars());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chose Your Car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarListBloc, CarListState>(
        builder: (contex, state) {
          if (state is CarListLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CarListLoaded) {
            List<Car> cars = state.cars;
            return ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: cars[index]);
              },
            );
          } else if (state is CarListError) {
            return Center(child: Text(state.message));
          }

          return Container();
        },
      ),
    );
  }
}
