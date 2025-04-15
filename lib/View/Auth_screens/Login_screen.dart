import 'package:ev_link/View/Auth_screens/Register_screen.dart';
import 'package:ev_link/View/Pages_screen/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final viewInsets = mediaQuery.viewInsets;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: -screenHeight * 0.20,
            right: -screenWidth * 0.54,
            child: Container(
              width: 542,
              height: 542,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF03C988).withOpacity(0.15),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.09),
                      Center(
                        child: Text(
                          'Login',
                          style: GoogleFonts.overpass(
                            textStyle: TextStyle(
                              fontSize: screenWidth * 0.08,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01),
                        child: Text(
                          'Welcome to the EvLink Charging application, please continue the login process.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.overpass(
                            textStyle: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: Colors.black.withOpacity(0.7),
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Container(
                        padding: EdgeInsets.all(screenHeight * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildInputField(
                                context: context,
                                controller: _emailController,
                                label: 'Email Address',
                                hint: 'Enter your email address',
                                icon: Icons.email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!value.contains('@')) {
                                    return 'Email must contain @';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              _buildInputField(
                                context: context,
                                controller: _passwordController,
                                label: 'Password',
                                hint: 'Enter your password',
                                icon: Icons.lock,
                                isPassword: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: screenHeight * 0.04),
                              _buildSignInButton(context),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.2),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: screenHeight * 0.05), // Adjust as needed
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.overpass(
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                children: [
                                  const TextSpan(
                                      text: 'Don\'t have an account? '),
                                  TextSpan(
                                    text: 'Register',
                                    style: TextStyle(
                                      color: const Color(0xFF03C988),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: viewInsets.bottom), // Prevents overlap
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF03C988),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          }
        },
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: screenHeight * 0.02,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    bool isObscured = isPassword;

    return StatefulBuilder(
      builder: (context, setState) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenHeight * 0.018,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: screenHeight * 0.008),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Padding(
              padding: EdgeInsets.all(screenHeight * 0.015),
              child: Row(
                children: [
                  Icon(icon,
                      color: Colors.grey.shade500, size: screenHeight * 0.025),
                  SizedBox(width: screenHeight * 0.015),
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      obscureText: isObscured,
                      style: TextStyle(fontSize: screenHeight * 0.018),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        suffixIcon: isPassword
                            ? IconButton(
                                icon: Icon(isObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    isObscured = !isObscured;
                                  });
                                },
                              )
                            : null,
                      ),
                      validator: validator,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
