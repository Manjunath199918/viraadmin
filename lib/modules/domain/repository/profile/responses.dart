part of 'my_profile_repository.dart';

enum ProfileFailureReason {
  unknown,
  invalidRequest,
}

class MyProfileFailure extends RepositoryFailure {
  final ProfileFailureReason reason;

  MyProfileFailure({
    int? statusCode,
    String? message,
    this.reason = ProfileFailureReason.unknown,
  }) : super(statusCode: statusCode, message: message);
}
class MyProfileSuccess extends RepositorySuccess {
  MyProfileSuccess({
    String? message,
  }) : super(message: message);
}


class PrivacyPolicySuccess extends MyProfileSuccess {
  final List<QnA> privacy_policy_list;

  PrivacyPolicySuccess({
    required this.privacy_policy_list,
  });
}

class PrivacyPolicyFailure extends MyProfileFailure {}

class FaqSuccess extends MyProfileSuccess {
  final List<QnA> faq_list;

  FaqSuccess({
    required this.faq_list,
  });
}

class FaqFailure extends MyProfileFailure {}

class SavedAddressSuccess extends MyProfileSuccess {
  final List<Address> address_list;

  SavedAddressSuccess({
    required this.address_list,
  });
}

class SavedAddressFailure extends MyProfileFailure {}



class GetAddressSuccess extends MyProfileSuccess {
  final Address address;

  GetAddressSuccess({
    required this.address,
  });
}

class GetAddressFailure extends MyProfileFailure {}


class CreateAddressSuccess extends MyProfileSuccess {}

class CreateAddressFailure extends MyProfileFailure {}

class UpdateAddressSuccess extends MyProfileSuccess {}

class UpdateAddressFailure extends MyProfileFailure {}