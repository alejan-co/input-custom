import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Color primaryColor = Color(0xFF4B33B2);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({required String hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
      filled: true,
      fillColor: const Color(0xFFE6E6E6),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26.0,
                  vertical: 18,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 36,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 12),

                      const Text(
                        'Inicio de Sesion',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 28),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Correo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        height: 48,
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: _inputDecoration(hint: ''),
                        ),
                      ),

                      const SizedBox(height: 18),

                      SizedBox(
                        height: 48,
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: _inputDecoration(hint: ''),
                        ),
                      ),

                      const Spacer(),

                      SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: SizedBox(
                            width: 220,
                            height: 48,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).maybePop();
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: primaryColor,
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Colors.white,
                                splashFactory: InkRipple.splashFactory,
                              ),
                              child: const Text(
                                'Volver',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
