import 'package:business_transactions/config/constants/string_const.dart';
import 'package:business_transactions/models/customer.dart';
import 'package:business_transactions/models/vehicle.dart';
import 'package:hive_ce/hive_ce.dart';

/// Manages direct interactions with the Hive database for Customers.
class CustomerLocalDataSource {
  final Box<Customer> _box;

  CustomerLocalDataSource(this._box);

  /// Retrieves all customers from local storage.
  Future<List<Customer>> getAllCustomers() async {
    try {
      return _box.values.toList();
    } catch (e) {
      throw Exception('$couldNotFetchCustomersException$colon $e');
    }
  }

  /// Adds a new customer or updates an existing one if the ID matches.
  Future<void> addOrUpdateCustomer(Customer customer) async {
    try {
      // Using 'put' with an ID allows for both insertion and updates.
      await _box.put(customer.id, customer);
    } catch (e) {
      throw Exception(
          '$couldNotSaveCustomerException ${customer.name}$colon $e');
    }
  }

  /// Permanently deletes a customer by ID.
  Future<void> deleteCustomer(String customerId) async {
    try {
      await _box.delete(customerId);
    } catch (e) {
      throw Exception('$couldNotDeleteCustomerException($customerId)$colon $e');
    }
  }

  Future<Customer?> getCustomerById(String customerId) async {
    try {
      return _box.get(customerId);
    } catch (e) {
      throw Exception(
          '$couldNotFetchCustomerByIdException ($customerId)$colon $e');
    }
  }

  // --- NEW METHODS FOR VEHICLES ---

  /// Adds a vehicle to a customer's list safely.
  Future<void> addVehicleToCustomer(String customerId, Vehicle vehicle) async {
    try {
      final customer = _box.get(customerId);
      if (customer != null) {
        // We create a new list to ensure mutability (in case default was const)
        final newVehicleList = List<Vehicle>.from(customer.vehicles);
        newVehicleList.add(vehicle);

        final updatedCustomer = customer.copyWith(vehicles: newVehicleList);
        await _box.put(customerId, updatedCustomer);
      }
    } catch (e) {
      throw Exception('Could not add vehicle to customer: $e');
    }
  }

  /// Updates a specific vehicle (e.g., editing number plate).
  Future<void> updateVehicleForCustomer(String customerId, Vehicle updatedVehicle) async {
    try {
      final customer = _box.get(customerId);
      if (customer != null) {
        final newVehicleList = List<Vehicle>.from(customer.vehicles);
        
        // Find index of the vehicle to update
        final index = newVehicleList.indexWhere((v) => v.id == updatedVehicle.id);
        
        if (index != -1) {
          newVehicleList[index] = updatedVehicle;
          final updatedCustomer = customer.copyWith(vehicles: newVehicleList);
          await _box.put(customerId, updatedCustomer);
        }
      }
    } catch (e) {
      throw Exception('Could not update vehicle: $e');
    }
  }
}


