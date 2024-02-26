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
    required this.user,
    required this.standard,
  });

  final Status status;
  final int index;
  final UserModel? user;
  final int? standard;

  factory _ViewState.initial() {
    return _ViewState(status: Idle(), index: 0, standard: 0, user: null);
  }

  _ViewState copyWith({
    Status? status,
    int? index,
    UserModel? user,
    int? standard,
  }) {
    return _ViewState(
        status: status ?? this.status,
        index: index ?? this.index,
        user: user ?? this.user,
        standard: standard ?? this.standard);
  }
}

class _ViewController extends StateNotifier<_ViewState> {
  final _VSControllerParams params;
  _ViewController({required this.params}) : super(_ViewState.initial());

  Status get status => state.status;

  final AuthRepository _repository = AuthRepository();
  SqliteService sqliteService = SqliteService();
  final persistentStorage = KPersistentStorage();
  TextEditingController phoneNumberController = TextEditingController();

  void _error(String message) {
    state = state.copyWith(status: Error(message));
  }

  void _idle() {
    state = state.copyWith(status: Idle());
  }

  init() async {
    state = state.copyWith(index: params.index);
    await getUserInfo();
    getStudents();
    // await initDataBase();
  }

  getUserInfo() async {
    final UserModel? userInfo = await persistentStorage.retrieve(
        key: 'user_details',
        decoder: (val) {
          return UserModel.fromJson(jsonDecode(val));
        });
    state = state.copyWith(user: userInfo);
  }

  initDataBase() async {
    bool isDatabaseExist = await sqliteService.isDatabaseExists();
    if (!isDatabaseExist) {
      await sqliteService.initializeDB(state.user!.schoolCode);
    }
  }

  void moveToAttendance(int i, int index) async {
    state = state.copyWith(index: i, standard: index);
  }

  getStudents() async {
    List<Map> students = await sqliteService.getData(
        '${state.user!.schoolCode}${Constants.classString[state.standard]}${Constants.students}');
    if (students.isEmpty) {
      CollectionReference st = FirebaseFirestore.instance.collection(
          '${state.user!.schoolCode}${Constants.classString[state.standard]}${Constants.students}');
      QuerySnapshot faculty = await st.get();

      for (var element in faculty.docs) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;
        StudentDetails singleStudent = StudentDetails.fromJson(data);
        await sqliteService.insertData(
            '${state.user!.schoolCode}${Constants.classString[state.standard]}${Constants.students}',
            singleStudent.toJson());
      }
      List studentslist = await sqliteService.getData(
          '${state.user!.schoolCode}${Constants.classString[state.standard]}${Constants.students}');
    } else {
      List studentslist = await sqliteService.getData(
          '${state.user!.schoolCode}${Constants.classString[state.standard]}${Constants.students}');
      studentslist.sort((a, b) {
        var adate = a['updtAt'];
        var bdate = b['updtAt'];
        return adate.compareTo(bdate);
      });
    }
  }

  void setIndex(int i) {
    state = state.copyWith(index: i);
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
