import '../repositories/trip_repo.dart';

class DeleteTrips {
  final TripRepository repository;

  DeleteTrips(this.repository);
  Future<void> call(int index) {
    return repository.deleteTrip(index);
  }
}
