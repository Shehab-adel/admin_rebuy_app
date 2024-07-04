abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLogin extends LoginState {}

class SuccessfulLogin extends LoginState {}

class FailLogin extends LoginState {}

class ChangeBrancheInDropdown extends LoginState {}

class LoadingLogout extends LoginState {}

class SuccessfulLogout extends LoginState {}

class FailLogout extends LoginState {}
