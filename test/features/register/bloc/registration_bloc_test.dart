import 'package:bloc_form/features/register/data/models/register.dart';
import 'package:bloc_form/features/register/presentation/bloc/registration_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RegistrationBloc registrationBloc;

  setUp(() async {
    registrationBloc = RegistrationBloc();
  });

  tearDown(() => registrationBloc.close());

  final registrationFormEmpty = Register.empty();

  blocTest<RegistrationBloc, RegistrationState>(
    'emits [register.FirstName] when FirstName is called',
    build: () => registrationBloc,
    act: (bloc) => bloc.add(const FirstNameTyped('Juan')),
    expect: () => <RegistrationState>[
      RegistrationInitial().copyWith(
        register: registrationFormEmpty.copyWith(firstName: 'Juan'),
      )
    ],
  );

  blocTest<RegistrationBloc, RegistrationState>(
    'emits [register.LastName] when LastName is called',
    build: () => registrationBloc,
    act: (bloc) => bloc.add(const LastNameTyped('Dela Cruz')),
    expect: () => <RegistrationState>[
      RegistrationInitial().copyWith(
        register: registrationFormEmpty.copyWith(lastName: 'Dela Cruz'),
      )
    ],
  );

  blocTest<RegistrationBloc, RegistrationState>(
    'emits [register.Age] when Age is called',
    build: () => registrationBloc,
    act: (bloc) => bloc.add(const AgeTyped(1)),
    expect: () => <RegistrationState>[
      RegistrationInitial().copyWith(
        register: registrationFormEmpty.copyWith(age: 1),
      )
    ],
  );

  blocTest<RegistrationBloc, RegistrationState>(
    'emits [register.Address] when Address is called',
    build: () => registrationBloc,
    act: (bloc) => bloc.add(const AddressTyped('Pasay City, Philippines')),
    expect: () => <RegistrationState>[
      RegistrationInitial().copyWith(
        register:
            registrationFormEmpty.copyWith(address: 'Pasay City, Philippines'),
      )
    ],
  );
}
