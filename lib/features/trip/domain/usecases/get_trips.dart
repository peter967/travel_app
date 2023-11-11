import 'package:travel_app/features/trip/domain/repositories/trip_repo.dart';

import '../entities/trip.dart';

class GetTrips {
  final TripRepository repository;

  GetTrips(this.repository);
  Future<Trip> call() {
    return repository.getTrips();
  }
}
