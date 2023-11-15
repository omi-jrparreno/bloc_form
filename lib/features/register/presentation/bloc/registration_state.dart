part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final Register register;
  final ViewStatus viewStatus;
  final String? errorMsg;

  const RegistrationState({
    required this.register,
    this.viewStatus = ViewStatus.initial,
    this.errorMsg,
  });

  RegistrationState copyWith({
    Register? register,
    ViewStatus? viewStatus,
    String? errorMsg,
  }) {
    return RegistrationState(
      register: register ?? this.register,
      viewStatus: viewStatus ?? this.viewStatus,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  factory RegistrationState.empty() {
    return RegistrationState(
      register: Register.empty(),
    );
  }

  @override
  List<Object?> get props => [
        register,
        viewStatus,
        errorMsg,
      ];
}

class RegistrationInitial extends RegistrationState {
  RegistrationInitial() : super(register: Register.empty());
}
