

abstract class AuthEvent{}

class AddUser extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;

  AddUser({required this.firstName,required this.lastName,required this.email});
}
class Login extends AuthEvent {
   Map<String,dynamic>body;
   Login(this.body);
}

class CheckLogin extends AuthEvent{}
class Logout extends AuthEvent{}
class SendOtp extends AuthEvent{}
class VerifyOtp extends AuthEvent {
  final String? otp;
  VerifyOtp({ this.otp});
}
class StartOtpTimer extends AuthEvent {}
class TickOtpTimer extends AuthEvent {}
class ResendOtp extends AuthEvent {}