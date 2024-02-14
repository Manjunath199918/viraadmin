part of '../event_broker.dart';

class SavedAddressScreenUpdate extends KEventX {
  SavedAddressScreenUpdate(); //Add new adress event
}

class FriendsScreenUpdate extends KEventX {
  final String displayName;
  FriendsScreenUpdate({required this.displayName});
}

class CardsScreenDelete extends KEventX {
  CardsScreenDelete();
}

class AddCardsScreenUpdate extends KEventX {
  AddCardsScreenUpdate();
}

class AddNewAddressFromRequestEvent extends KEventX {
  final Address address;
  AddNewAddressFromRequestEvent({required this.address});
}



class ProfileUpdate extends KEventX {
  ProfileUpdate();
}

class AddressUpdate extends KEventX {
  AddressUpdate();
}

class RequestRejectEvent extends KEventX {
  RequestRejectEvent();
}

class RequestDeleteEvent extends KEventX {
  RequestDeleteEvent();
}

class SettlementEvent extends KEventX {
  SettlementEvent();
}


class UpdateNotificationPage extends KEventX {
  UpdateNotificationPage();
}

class RequestShareIntent extends KEventX {
  final String productUrl;
  RequestShareIntent({required this.productUrl});
}

class BestPriceIntent extends KEventX {
  final String productUrl;
  BestPriceIntent({required this.productUrl});
}

class OrderPaymentCheckIntent extends KEventX {
  final String orderId;
  OrderPaymentCheckIntent({required this.orderId});
}
class TopUpCompletedEvent extends KEventX {
  final String orderId;
  TopUpCompletedEvent({required this.orderId});
}
class RequestMoneyCompletedEvent extends KEventX {
  RequestMoneyCompletedEvent();
}