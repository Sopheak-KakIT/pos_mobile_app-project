import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/Helper/pos_text_formfield.dart';
import 'package:pos/Helper/social_button.dart';
import 'package:pos/Screen/UserRepository.dart';
import 'package:pos/Screen/main_screen.dart';
import 'package:pos/Screen/sign_up_screen.dart'; // import your UserRepository

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Welcome Home!')),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      final success = UserRepository.login(email, password);

      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        // show error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Please enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SizedBox(height: 70),
          Text(
            "Sign In",
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 32, 85, 228),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'Sign in to continue',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),

          // Social Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(
                imagePath: "asset/images/facebook_icon.png",
                label: "Facebook",
                onPressed: () => debugPrint("Facebook pressed"),
              ),
              const SizedBox(width: 16),
              SocialButton(
                imagePath: "asset/images/google_icon.png",
                label: "Google",
                onPressed: () => debugPrint("Google pressed"),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: Divider(color: HexColor('#E0E5EC'))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Or',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(child: Divider(color: HexColor('#E0E5EC'))),
            ],
          ),
          const SizedBox(height: 24),

          Form(
            key: _formKey,
            child: Column(
              children: [
                PosTextFormfield(
                  controller: _emailController,
                  label: "Email",
                  hintText: "Enter your email",
                  prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 16),
                PosTextFormfield(
                  controller: _passwordController,
                  label: "Password",
                  hintText: "Enter your password",
                  prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
                  isObscure: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey[600],
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  validator: _validatePassword,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => debugPrint('Forgot Password pressed'),
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 61, 61, 61),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 32, 85, 228),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: _login,
            child: Text(
              "Login",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have account? ",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to your existing SignUpScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 32, 85, 228),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
