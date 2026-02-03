

abstract class AuthEvent{}

class Login extends AuthEvent {
   Map<String,dynamic>body;
   Login(this.body);
}