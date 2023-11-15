part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class FirstNameTyped extends RegistrationEvent {
  const FirstNameTyped(this.firstName);
  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class LastNameTyped extends RegistrationEvent {
  const LastNameTyped(this.lastName);
  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class AgeTyped extends RegistrationEvent {
  const AgeTyped(this.age);
  final int age;

  @override
  List<Object> get props => [age];
}

class AddressTyped extends RegistrationEvent {
  const AddressTyped(this.address);
  final String address;

  @override
  List<Object> get props => [address];
}

class OnSubmitForm extends RegistrationEvent {}
