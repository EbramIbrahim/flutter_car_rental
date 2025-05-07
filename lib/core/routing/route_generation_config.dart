import 'package:car_rental/core/data/car.dart';
import 'package:car_rental/core/routing/app_route.dart';
import 'package:car_rental/feature/car_details/presentation/car_details_screen.dart';
import 'package:car_rental/feature/cars_list/presentation/bloc/car_list_bloc.dart';
import 'package:car_rental/feature/cars_list/presentation/ui/car_list_screen.dart';
import 'package:car_rental/feature/di/service_locator.dart';
import 'package:car_rental/feature/map_details/presentation/map_details_screen.dart';
import 'package:car_rental/feature/onBoarding/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouteGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoute.onBoardingScreen,
    routes: [
      GoRoute(
        name: AppRoute.onBoardingScreen,
        path: AppRoute.onBoardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: AppRoute.carsListScreen,
        path: AppRoute.carsListScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => sl<CarListBloc>(),
              child: CarListScreen(),
            ),
      ),
      GoRoute(
        name: AppRoute.carDetailsScreen,
        path: AppRoute.carDetailsScreen,
        builder: (context, state) {
          final Car car = state.extra as Car;
          return CarDetailsScreen(car: car);
        },
      ),
      GoRoute(
        name: AppRoute.mapScreen,
        path: AppRoute.mapScreen,
        builder: (context, state) {
          final Car car = state.extra as Car;
          return MapsDetailsPage(car: car);
        },
      ),
    ],
  );
}
