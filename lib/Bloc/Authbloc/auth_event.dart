

abstract class AuthEvent{}

class Login extends AuthEvent {
   Map<String,dynamic>body;
   Login(this.body);
}

class CheckLogin extends AuthEvent{}

class Logout extends AuthEvent{}
