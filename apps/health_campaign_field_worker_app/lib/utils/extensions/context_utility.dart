part of 'extensions.dart';

extension ContextUtilityExtensions on BuildContext {
  int millisecondsSinceEpoch([DateTime? dateTime]) {
    return (dateTime ?? DateTime.now()).millisecondsSinceEpoch;
  }

  Future<String> get packageInfo async {
    final info = await PackageInfo.fromPlatform();

    return info.version;
  }

  ProjectModel get selectedProject {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;
    final selectedProject = projectState.selectedProject;

    if (selectedProject == null) {
      throw AppException('No project is selected');
    }

    return selectedProject;
  }

  String get projectId => selectedProject.id;

  int get maximumQuantity {
    int totalNumber = 0;
    List<TargetModel> filterData = selectedProject.targets!
        .where(
          (element) => element.beneficiaryType == BeneficiaryType.individual,
        )
        .toList();

    totalNumber =
        filterData.isNotEmpty ? filterData.first.totalNo!.toInt() : 10000;

    int expectedCount = (totalNumber * 1.3) ~/ 2;

    return expectedCount;
  }

  Cycle get selectedCycle {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;
    final selectedCycle = projectState.selectedCycle;

    if (selectedCycle == null) {
      return const Cycle();
    }

    return selectedCycle;
  }

  BoundaryModel get boundary {
    final boundaryBloc = _get<BoundaryBloc>();
    final boundaryState = boundaryBloc.state;

    final selectedBoundary = boundaryState.selectedBoundaryMap.entries
        .where((element) => element.value != null)
        .lastOrNull
        ?.value;

    if (selectedBoundary == null) {
      throw AppException('No boundary is selected');
    }

    return selectedBoundary;
  }

  BeneficiaryType get beneficiaryType {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;

    final BeneficiaryType selectedBeneficiary =
        projectState.projectType?.beneficiaryType ==
                BeneficiaryType.household.toValue()
            ? BeneficiaryType.household
            : BeneficiaryType.individual;

    if (selectedBeneficiary == null) {
      throw AppException('No beneficiary type is selected');
    }

    return selectedBeneficiary;
  }

  BoundaryModel? get boundaryOrNull {
    try {
      return boundary;
    } catch (_) {
      return null;
    }
  }

  List<UserRoleModel> get loggedInUserRoles {
    final authBloc = _get<AuthBloc>();
    final userRequestObject = authBloc.state.whenOrNull(
      authenticated: (accessToken, refreshToken, userModel, actionsWrapper) {
        return userModel.roles;
      },
    );

    if (userRequestObject == null) {
      throw AppException('User not authenticated');
    }

    return userRequestObject;
  }

  String get loggedInUserUuid => loggedInUser.uuid;

  UserRequestModel get loggedInUser {
    final authBloc = _get<AuthBloc>();
    final userRequestObject = authBloc.state.whenOrNull(
      authenticated: (accessToken, refreshToken, userModel, actions) {
        return userModel;
      },
    );

    if (userRequestObject == null) {
      throw AppException('User not authenticated');
    }

    return userRequestObject;
  }

  bool get showProgressBar {
    UserRequestModel loggedInUser;

    try {
      loggedInUser = this.loggedInUser;
    } catch (_) {
      return false;
    }

    for (final role in loggedInUser.roles) {
      switch (role.code) {
        case "REGISTRAR":
        case "COMMUNITY_DISTRIBUTOR":
          return true;
        default:
          break;
      }
    }

    return false;
  }

  bool get isRegistrar {
    UserRequestModel loggedInUser;

    try {
      loggedInUser = this.loggedInUser;
    } catch (_) {
      return false;
    }

    for (final role in loggedInUser.roles) {
      switch (role.code) {
        case "REGISTRAR":
          return true;
        default:
          break;
      }
    }

    return false;
  }

  NetworkManager get networkManager => read<NetworkManager>();

  DataRepository<D, R>
      repository<D extends EntityModel, R extends EntitySearchModel>() =>
          networkManager.repository<D, R>(this);

  T _get<T extends BlocBase>() {
    try {
      final bloc = read<T>();

      return bloc;
    } on ProviderNotFoundException catch (_) {
      throw AppException(
        '${T.runtimeType} not found in the current context',
      );
    } catch (error) {
      throw AppException('Could not fetch ${T.runtimeType}');
    }
  }

// to check  logged in user is isWarehouseManager or not
  bool get isWarehouseManager {
    final authState = _get<AuthBloc>().state;

    if (authState is! AuthAuthenticatedState) {
      return false;
    }

    final roles = authState.userModel.roles.map((e) {
      return e.code;
    });

    return roles.contains("WAREHOUSE_MANAGER");
  }
}
