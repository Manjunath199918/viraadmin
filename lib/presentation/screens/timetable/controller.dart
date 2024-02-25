part of 'view.dart';

class _VSControllerParams extends Equatable {
  final int? index;
  _VSControllerParams({
    this.index,
  });
  @override
  List<Object> get props => [];
}

final _paramsProvider = Provider<_VSControllerParams>((ref) {
  throw UnimplementedError();
});

final _vsProvider = StateNotifierProvider.autoDispose
    .family<_ViewController, _ViewState, _VSControllerParams>((ref, params) {
  final stateController = _ViewController(params: params);
  stateController.init();
  return stateController;
});

class _ViewState {
  const _ViewState({
    required this.status,
    required this.index,
    required this.standard,
    required this.user,
    required this.startTime,
    required this.endTime,
  });

  final Status status;
  final int index;
  final int standard;
  final UserModel? user;
  final String? startTime;
  final String? endTime;

  factory _ViewState.initial() {
    return _ViewState(
      status: Idle(),
      index: 0,
      standard: 0,
      user: null,
      startTime: '',
      endTime: '',
    );
  }

  _ViewState copyWith({
    Status? status,
    int? index,
    int? standard,
    UserModel? user,
    String? startTime,
    String? endTime,
  }) {
    return _ViewState(
        status: status ?? this.status,
        index: index ?? this.index,
        standard: standard ?? this.standard,
        user: user ?? this.user,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime);
  }
}

class _ViewController extends StateNotifier<_ViewState> {
  final _VSControllerParams params;
  _ViewController({required this.params}) : super(_ViewState.initial());

  Status get status => state.status;

  final AuthRepository _repository = AuthRepository();
  final persistentStorage = KPersistentStorage();
  TextEditingController phoneNumberController = TextEditingController();

  void _error(String message) {
    state = state.copyWith(status: Error(message));
  }

  void _idle() {
    state = state.copyWith(status: Idle());
  }

  init() {
    state = state.copyWith(
      index: params.index,
    );
    getUserInfo();
  }

  getUserInfo() async {
    final UserModel? userInfo = await persistentStorage.retrieve(
        key: 'user_details',
        decoder: (val) {
          return UserModel.fromJson(jsonDecode(val));
        });
    state = state.copyWith(user: userInfo);
  }

  void setIndex(int i) {
    state = state.copyWith(index: i);
  }

  moveToTimeTable(int i, int index) {
    state = state.copyWith(index: i, standard: index);
  }

  addTimeTable(
    String title,
    String des,
  ) async {
    try {
      state = state.copyWith(status: Busy());

      DocumentReference timetable = FirebaseFirestore.instance
          .collection(
              '${state.user!.schoolCode}${Constants.classString[state.standard]}TIMETABLE')
          .doc();
      await timetable.set({
        'title': title,
        'assignTo': des,
        'time': state.startTime! + state.endTime!,
        'date': DateTime.now(),
        'uploadedBy': '${state.user!.firstName} ${state.user!.lastName}',
        'uploadedId': state.user!.id
      });
      state = state.copyWith(status: Idle());
      KAppX.router.pop();
    } catch (e) {
      state = state.copyWith(status: Idle());
      _error('error in uploading... try again later');
      _idle();
    }
  }

  getStartTime(BuildContext context) async {
    String? startTime1 = await selectTime(context);
    state = state.copyWith(startTime: startTime1);
  }

  getEndTime(BuildContext context) async {
    String? startTime1 = await selectTime(context);
    state = state.copyWith(endTime: startTime1);
  }

  getTimetable() {}

  Future<String?> selectTime(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext? context, Widget? child) {
        return child!;
      },
    );
    if (picked != null) {
      return '${picked.hour}:${picked.minute}';
    } else {
      return null;
    }
  }

  Future<String?> getDate(BuildContext context, var currentTheme) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
      builder: (BuildContext context, Widget? child) {
        return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: currentTheme.themeBox.colors.darkBlue,
              ),
            ),
            child: child!);
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      return formattedDate;
    } else {
      return null;
    }
  }
}
