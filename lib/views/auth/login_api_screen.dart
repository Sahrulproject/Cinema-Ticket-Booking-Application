import 'package:flutter/material.dart';
import 'package:tixclick/api/register_user.dart';
import 'package:tixclick/extension/navigation.dart';
import 'package:tixclick/models/register_model.dart';
import 'package:tixclick/services/auth_service.dart';
import 'package:tixclick/views/auth/home_api.dart';
import 'package:tixclick/views/auth/post_api_screen.dart';

class LoginAPIScreen extends StatefulWidget {
  const LoginAPIScreen({super.key});
  static const id = "/login_api";
  @override
  State<LoginAPIScreen> createState() => _LoginAPIScreenState();
}

class _LoginAPIScreenState extends State<LoginAPIScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RegisterUserModel? user;
  String? errorMessage;
  bool isLoading = false;
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A3B55),
      body: Stack(children: [buildBackground(), buildLayer()]),
    );
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email dan Password tidak boleh kosong")),
      );
      setState(() => isLoading = false);
      return;
    }

    try {
      final result = await AuthenticationAPI.loginUser(
        email: email,
        password: password,
      );

      setState(() {
        user = result;
      });

      // DEBUG PRINT
      _debugPrintResponse();

      // PERBAIKAN: Token sekarang di root, bukan dalam data
      if (user?.token != null) {
        await _saveUserData(email);

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login berhasil")));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MovieApp()),
        );
      } else {
        throw Exception("Token tidak ditemukan dalam response");
      }
    } catch (e) {
      _debugPrintError(e);
      setState(() {
        errorMessage = e.toString();
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login gagal: $errorMessage")));
    } finally {
      setState(() => isLoading = false);
    }
  }

  // Method untuk debug print response
  void _debugPrintResponse() {
    print('=== DEBUG LOGIN RESPONSE ===');
    print('Message: ${user?.message}');
    print('Token: ${user?.token}'); // Token di root
    print('User name: ${user?.user?.name}');
    print('User email: ${user?.user?.email}');
    print('User ID: ${user?.user?.id}');
    print('Email verified: ${user?.user?.emailVerifiedAt}');
    print('Full response: ${user?.toJson()}');
    print('============================');
  }

  // Method untuk debug print error
  void _debugPrintError(dynamic e) {
    print('=== LOGIN ERROR ===');
    print('Error: $e');
    print('Error type: ${e.runtimeType}');
    if (e is Error) {
      print('Stack trace: ${e.stackTrace}');
    }
    print('===================');
  }

  // Method untuk save user data - DIUBAH untuk model baru
  Future<void> _saveUserData(String email) async {
    // PERBAIKAN: Token di root, bukan dalam data
    await AuthService.saveToken(user!.token!);
    await AuthService.saveUserEmail(email);

    final userName = user?.user?.name;
    if (userName != null && userName.isNotEmpty) {
      await AuthService.saveUserName(userName);
    } else {
      await AuthService.saveUserName(email);
    }

    final userId = user?.user?.id;
    if (userId != null) {
      await AuthService.saveUserId(userId);
    }

    print('=== DATA YANG DISIMPAN ===');
    print('Token: ${user!.token}'); // Token di root
    print('Name: ${userName ?? email}');
    print('Email: $email');
    print('ID: $userId');
    print('==========================');
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/lg_tixclick.png",
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              Text(
                "TIXCLICK",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "BebasNeue",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              height(24),
              buildTitle("Email Address"),
              height(12),
              buildTextField(
                hintText: "Enter your email",
                controller: emailController,
              ),
              height(16),
              buildTitle("Password"),
              height(12),
              buildTextField(
                hintText: "Enter your password",
                isPassword: true,
                controller: passwordController,
              ),
              height(12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password functionality
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              height(8),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: isLoading ? null : loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isLoading
                        ? Colors.grey
                        : const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.black)
                      : Text(
                          "Login",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                ),
              ),
              height(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Or Sign In With",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              height(18),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Google sign in functionality
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google.png",
                        height: 20,
                        width: 20,
                      ),
                      width(4),
                      Text("Google", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
              height(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(const PostApiScreen());
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
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

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(),
    );
  }

  TextField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? !isVisibility : false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.5),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.5),
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.white)),
      ],
    );
  }
}
