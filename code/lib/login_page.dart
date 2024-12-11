import 'package:code/home.dart';
import 'package:code/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  void _onForgotPasswordPressed() {
    print("Forgot Password clicked");
  }

  void _onLoginPressed() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    if (_emailController.text.isEmpty) {
      setState(() {
        _emailError = 'Please enter your email';
      });
    } else if (_passwordController.text.isEmpty) {
      setState(() {
        _passwordError = 'Please enter your password';
      });
    } else {
      print(
          "Logging in with email: ${_emailController.text} and password: ${_passwordController.text}");
      // Navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  void _onRegisterNowPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  void _onSocialLoginPressed(String platform) {
    print("Login with $platform clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 40),
                child: Text(
                  "Welcome back! Glad\nTo see you Again!",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 30),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF6F9F8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color(0XFF6A707C).withOpacity(0.5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color(0XFF6A707C).withOpacity(0.5),
                      ),
                    ),
                    hintText: 'Enter your email',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16),
                    errorText: _emailError,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF6F9F8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color(0XFF6A707C).withOpacity(0.2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: const Color(0XFF6A707C).withOpacity(0.3),
                      ),
                    ),
                    hintText: 'Enter your Password',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16),
                    errorText: _passwordError,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF6A707C),
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: _onForgotPasswordPressed,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xFF6A707C),
                  ),
                  onPressed: _onLoginPressed,
                  child: Text(
                    "Log in",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: const Color(0xFF6A707C).withOpacity(0.3),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "or  Login with",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: const Color(0xFF6A707C).withOpacity(0.3),
                          ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: const Color(0xFF6A707C).withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _onSocialLoginPressed('GitHub'),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF6A707C).withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _onSocialLoginPressed('Google'),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF6A707C).withOpacity(0.3),
                          ),
                        ),
                        child: Image.asset('google.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _onSocialLoginPressed('Facebook'),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF6A707C).withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: _onRegisterNowPressed,
                    child: Text(
                      "Register Now",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
