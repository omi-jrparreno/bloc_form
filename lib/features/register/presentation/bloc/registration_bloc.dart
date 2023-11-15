import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_form/core/enums/view_status.dart';
import 'package:bloc_form/features/register/data/models/register.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<FirstNameTyped>(_firstNameTyped);
    on<LastNameTyped>(_lastNameTyped);
    on<AgeTyped>(_ageTyped);
    on<AddressTyped>(_addressTyped);
    on<OnSubmitForm>(_onSubmitForm);
  }

  void _firstNameTyped(FirstNameTyped event, Emitter<RegistrationState> emit) {
    emit(
      state.copyWith(
        register: state.register.copyWith(firstName: event.firstName),
      ),
    );
  }

  void _lastNameTyped(LastNameTyped event, Emitter<RegistrationState> emit) {
    emit(
      state.copyWith(
        register: state.register.copyWith(lastName: event.lastName),
      ),
    );
  }

  void _ageTyped(AgeTyped event, Emitter<RegistrationState> emit) {
    emit(
      state.copyWith(
        register: state.register.copyWith(age: event.age),
      ),
    );
  }

  void _addressTyped(AddressTyped event, Emitter<RegistrationState> emit) {
    emit(
      state.copyWith(
        register: state.register.copyWith(address: event.address),
      ),
    );
  }

  void _onSubmitForm(OnSubmitForm event, Emitter<RegistrationState> emit) {
    print(state);
  }
}
