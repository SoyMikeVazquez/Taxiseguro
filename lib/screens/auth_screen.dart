import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'splash_router_screen.dart';
import 'driver_registration_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  // Custom User fields for Sign Up
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _isLogin = true;
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();

    try {
      if (_isLogin) {
        try {
          // Sign in
          print('Iniciando sesión con email: $email');
          await Supabase.instance.client.auth.signInWithPassword(
            email: email,
            password: password,
          );
          print('Sesión iniciada correctamente, procediendo a SplashRouterScreen');
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sesión iniciada con éxito'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const SplashRouterScreen()),
              (route) => false,
            );
          }
        } on AuthException catch (e) {
          // Detectar si es un usuario migrado de Firebase
          if (e.message.contains('Unexpected failure') || 
              e.message.contains('Database error querying schema')) {
            try {
              final res = await Supabase.instance.client.functions.invoke(
                'migrate_firebase_user',
                body: {'email': email, 'password': password},
              );

              if (res.status == 200) {
                await Supabase.instance.client.auth.signInWithPassword(
                  email: email,
                  password: password,
                );
                
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sesión iniciada con éxito. ¡Bienvenido de nuevo!'),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const SplashRouterScreen()),
                    (route) => false,
                  );
                }
                return;
              } else {
                throw const AuthException('Credenciales incorrectas');
              }
            } catch (functionError) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error al validar la cuenta. Por favor, intenta restablecer tu contraseña.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
              return;
            }
          }
          rethrow;
        }
      } else {
        // Sign up in auth.users
        final res = await Supabase.instance.client.auth.signUp(
          email: email,
          password: password,
        );

        final userId = res.user?.id;

        if (userId != null) {
          // 1. Register in public.users as Passenger
          await Supabase.instance.client.from('users').insert({
            'user_id': userId,
            'nombre': name.isNotEmpty ? name : email.split('@').first,
            'correo': email,
            'telefono': phone,
            'isConductor': false,
          });
        }

        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              title: const Text('Registro Exitoso'),
              content: const Text(
                'Te hemos enviado un correo de confirmación. Por favor, confirma tu cuenta para iniciar sesión.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _isLogin = true;
                      _passwordController.clear();
                    });
                  },
                  child: const Text('Ir al Login', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        }
      }
    } on AuthException catch (error) {
      if (mounted) {
        String errorMsg = error.message;
        if (errorMsg.contains('User already registered') || errorMsg.contains('already exists')) {
          errorMsg = 'Este correo ya está registrado. Por favor, inicia sesión.';
        } else if (errorMsg.contains('Invalid login credentials')) {
          errorMsg = 'El correo o la contraseña son incorrectos.';
        } else if (errorMsg.contains('Password should be at least 6 characters')) {
          errorMsg = 'La contraseña debe tener al menos 6 caracteres.';
        } else if (errorMsg.contains('Email rate limit exceeded')) {
          errorMsg = 'Demasiados intentos. Por favor, espera un momento.';
        }
        _showErrorSnackBar(errorMsg);
      }
    } catch (error) {
      if (mounted) {
        _showErrorSnackBar('Ocurrió un error inesperado al registrar los datos: $error');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _handleForgotPassword() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      _showErrorSnackBar('Por favor ingresa tu correo electrónico para restablecer la contraseña.');
      return;
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(email)) {
      _showErrorSnackBar('Ingresa un correo electrónico válido');
      return;
    }

    try {
      setState(() => _isLoading = true);
      await Supabase.instance.client.auth.resetPasswordForEmail(email);
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            title: const Text('Recuperación enviada'),
            content: Text(
              'Hemos enviado un enlace de restablecimiento a "$email". Por favor revisa tu bandeja de entrada o correo no deseado.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Entendido', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        _showErrorSnackBar('No se pudo enviar el correo de recuperación: $error');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.redAccent[700],
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool isObscure = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          keyboardType: keyboardType,
          style: const TextStyle(fontFamily: 'Inter', fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontFamily: 'Inter', color: Colors.black.withOpacity(0.35)),
            filled: true,
            fillColor: const Color(0xFFF3F3F3),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
            ),
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://images.pexels.com/photos/5357606/pexels-photo-5357606.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          
          // Form Content
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                
                // Form Container
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isLogin ? 'Bienvenido de nuevo' : 'Crea tu cuenta',
                          style: const TextStyle(
                            fontFamily: 'Google Sans',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _isLogin 
                              ? 'Ingresa para continuar tu viaje.' 
                              : 'Regístrate para usar Taxiseguro.',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Extra fields for Sign Up
                        if (!_isLogin) ...[
                          _buildTextField(
                            controller: _nameController,
                            label: 'Nombre completo',
                            hint: 'Ej: Mike Vázquez',
                          ),
                          _buildTextField(
                            controller: _phoneController,
                            label: 'Número de teléfono',
                            hint: 'Ej: 8110002233',
                            keyboardType: TextInputType.phone,
                          ),
                        ],

                        // Email
                        _buildTextField(
                          controller: _emailController,
                          label: 'Correo electrónico',
                          hint: 'ejemplo@taxiseguro.com',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu correo electrónico';
                            }
                            final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailRegExp.hasMatch(value.trim())) {
                              return 'Ingresa un correo electrónico válido';
                            }
                            return null;
                          },
                        ),

                        // Password
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Contraseña',
                          hint: '••••••••',
                          isObscure: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe tener al menos 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        
                        if (_isLogin) ...[
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: _isLoading ? null : _handleForgotPassword,
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                '¿Olvidaste tu contraseña?',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.black87,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],

                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleSubmit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC7FF2E), // Electric Green
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      color: Colors.black,
                                    ),
                                  )
                                : Text(
                                    _isLogin ? 'Iniciar sesión' : 'Registrarse',
                                    style: const TextStyle(
                                      fontFamily: 'Google Sans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Toggle Login/Register
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLogin = !_isLogin;
                                _formKey.currentState?.reset();
                                _emailController.clear();
                                _passwordController.clear();
                              });
                            },
                            child: RichText(
                              text: TextSpan(
                                text: _isLogin 
                                    ? '¿No tienes una cuenta? ' 
                                    : '¿Ya tienes una cuenta? ',
                                style: const TextStyle(
                                  fontFamily: 'Inter', 
                                  color: Colors.black54, 
                                  fontSize: 14
                                ),
                                children: [
                                  TextSpan(
                                    text: _isLogin ? 'Regístrate' : 'Inicia sesión',
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate().fade(duration: 500.ms, delay: 200.ms).slideY(begin: 0.1, end: 0, duration: 500.ms, curve: Curves.easeOutQuad, delay: 200.ms),
                
                const SizedBox(height: 20),
                
                // Driver Registration Link
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const DriverRegistrationScreen()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '¿Quieres ser conductor? Regístrate aquí',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ).animate().fade(duration: 500.ms, delay: 400.ms).slideY(begin: 0.2, end: 0, duration: 500.ms, curve: Curves.easeOutQuad, delay: 400.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
