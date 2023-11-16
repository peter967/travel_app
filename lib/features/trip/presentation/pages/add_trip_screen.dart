import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _locationController = TextEditingController();
  final _pictureController = TextEditingController();
  List<String> picture = [];

  AddTripScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          ElevatedButton(
            onPressed: () {
              picture.add(_pictureController.text);
              if (_formKey.currentState!.validate()) {
                final newTrip = Trip(
                  title: _titleController.text,
                  photos: picture,
                  description: _descController.text,
                  date: DateTime.now(),
                  location: _descController.text,
                );
                ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
                ref.watch(tripListNotifierProvider.notifier).loadTrips();
              }
            },
            child: const Text('Add Trip'),
          ),
        ],
      ),
    );
  }
}
