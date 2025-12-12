import 'package:flutter/material.dart';
import '../models/user_data.dart';

class RegisterScreen extends StatefulWidget {
  final UserData userData;
  const RegisterScreen({super.key, required this.userData});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static const Color primaryColor = Color(0xFF4B33B2);

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmController;
  late final TextEditingController phoneController;
  late final TextEditingController extraController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userData.name);
    emailController = TextEditingController(text: widget.userData.email);
    passwordController = TextEditingController(text: widget.userData.password);
    confirmController = TextEditingController(
      text: widget.userData.confirmPassword,
    );
    phoneController = TextEditingController(text: widget.userData.phone);
    extraController = TextEditingController(text: widget.userData.extra);

    nameController.addListener(
      () => widget.userData.name = nameController.text,
    );
    emailController.addListener(
      () => widget.userData.email = emailController.text,
    );
    passwordController.addListener(
      () => widget.userData.password = passwordController.text,
    );
    confirmController.addListener(
      () => widget.userData.confirmPassword = confirmController.text,
    );
    phoneController.addListener(
      () => widget.userData.phone = phoneController.text,
    );
    extraController.addListener(
      () => widget.userData.extra = extraController.text,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    phoneController.dispose();
    extraController.dispose();
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

  Widget _field({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 48,
        child: TextField(
          controller: controller,
          obscureText: obscure,
          decoration: _inputDecoration(hint: hint),
        ),
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
                    children: [
                      const SizedBox(height: 12),
                      const Text(
                        'Registro',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),

                      _field(controller: nameController, hint: 'Nombre'),
                      _field(
                        controller: emailController,
                        hint: 'Correo Electronico',
                      ),
                      _field(
                        controller: passwordController,
                        hint: 'Contraseña',
                        obscure: true,
                      ),
                      _field(
                        controller: confirmController,
                        hint: 'Confirmar contraseña',
                        obscure: true,
                      ),
                      _field(controller: phoneController, hint: 'Teléfono'),

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
                                  color: Color.fromARGB(255, 10, 131, 139),
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: const Text(
                                'Volver',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 10, 131, 139),
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
