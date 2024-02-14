part of 'users_repository.dart';

enum UsersFailureReason {
  unknown,
  invalidRequest,
}

class UsersFailure extends RepositoryFailure {
  final UsersFailureReason reason;

  UsersFailure({
    int? statusCode,
    String? message,
    this.reason = UsersFailureReason.unknown,
  }) : super(statusCode: statusCode, message: message);
}

class UsersSuccess extends RepositorySuccess {
  UsersSuccess({
    String? message,
  }) : super(message: message);
}

class RegisterTokenSuccess extends UsersSuccess {}

class RegisterTokenFailure extends UsersFailure {}

class AddNewAddressSuccess extends UsersSuccess {
  final List<Address> addressList;

  AddNewAddressSuccess({
    required this.addressList,
  });

  factory AddNewAddressSuccess.fromJson(Map<String, dynamic> json) => AddNewAddressSuccess(
        addressList: List<Address>.from(
          json['addressList'].map((v) => Address.fromJson(v)),
        ),
      );
}

class AddNewAddressFailure extends UsersFailure {}
