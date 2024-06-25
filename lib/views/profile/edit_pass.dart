import 'package:dus_app/views/profile/profile.dart';
import 'package:flutter/material.dart';

class EditPassPage extends StatefulWidget {
  const EditPassPage({super.key});

  @override
  State<EditPassPage> createState() => _EditPassPageState();
}

class _EditPassPageState extends State<EditPassPage> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perbarui Sandi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildPasswordField(
                  'Sandi Lama',
                  _oldPasswordController,
                  'Masukkan sandi lama',
                ),
                const SizedBox(height: 24),
                _buildPasswordField(
                  'Sandi Baru',
                  _newPasswordController,
                  'Masukkan sandi baru',
                ),
                const SizedBox(height: 24),
                _buildPasswordField(
                  'Konfirmasi Sandi',
                  _confirmPasswordController,
                  'Konfirmasi sandi baru',
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF193E26),
                          side: const BorderSide(color: Color(0xFF193E26)),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text('Batal'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextButton(
                        onPressed: _updatePassword,
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF28653D),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Perbarui',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(
      String label, TextEditingController controller, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.black26),
            ),
            contentPadding: const EdgeInsets.all(14),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Mohon isi field ini';
            }
            return null;
          },
        ),
      ],
    );
  }

  void _updatePassword() {
    if (_formKey.currentState!.validate()) {
      // Setelah berhasil, kembali ke halaman sebelumnya
      Navigator.of(context).pop();
    }
  }
}
