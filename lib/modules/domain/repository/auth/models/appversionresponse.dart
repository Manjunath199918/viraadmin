class AppVersionModel {
  AppVersionModel({

    required this.message,
  });

  String message;


  factory AppVersionModel.fromJson(Map<String, dynamic> json) {
    return AppVersionModel(
        message: json['message'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,

    };
  }
}
