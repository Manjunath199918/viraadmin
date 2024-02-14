abstract class Status {
  final String? _message;

  Status([this._message]);

  String? get message => _message;
}

class Idle extends Status {
  Idle([this.state]) : super(state);

  final String? state;
}

class Loading extends Status {
  Loading();
}

class Busy extends Status {
  Busy();
}

class Error extends Status {
  Error(this.error) : super(error);

  final String error;
}
