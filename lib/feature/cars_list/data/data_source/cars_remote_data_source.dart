import 'package:car_rental/core/data/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarsRemoteDataSource {
  final FirebaseFirestore firestore;
  CarsRemoteDataSource({required this.firestore});

  Future<List<Car>> getCarsFromRemote() async {
    var cars = await firestore.collection('cars').get();
    return cars.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
