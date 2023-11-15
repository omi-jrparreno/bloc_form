import 'package:bloc_form/core/enums/view_status.dart';
import 'package:bloc_form/features/register/presentation/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register/';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegistrationBloc registrationBloc;

  @override
  void initState() {
    registrationBloc = BlocProvider.of<RegistrationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Form Test'),
        elevation: 1,
      ),
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
        bloc: registrationBloc,
        builder: (context, state) {
          if (state.viewStatus == ViewStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.viewStatus == ViewStatus.failed) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) =>
                      registrationBloc.add(FirstNameTyped(value)),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Firstname',
                  ),
                ),
                const Gap(15),
                TextField(
                  onChanged: (value) =>
                      registrationBloc.add(LastNameTyped(value)),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lastname',
                  ),
                ),
                const Gap(15),
                TextField(
                  onChanged: (value) =>
                      registrationBloc.add(AgeTyped(int.parse(value))),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Age',
                  ),
                ),
                const Gap(15),
                TextField(
                  onChanged: (value) =>
                      registrationBloc.add(AddressTyped(value)),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                ),
                const Gap(15),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    registrationBloc.add(OnSubmitForm());
                  },
                  child: const Text('Submit Form'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
