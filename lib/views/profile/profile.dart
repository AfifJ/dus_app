import 'package:dus_app/views/profile/edit_pass.dart';
import 'package:flutter/material.dart';
import 'package:dus_app/config/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorLightWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 24,
            color: Constant.colorBlack,
          ),
        ),
        title: const Text(
          'Akun Anda',
          style: TextStyle(
            fontSize: 20,
            fontWeight: Constant.fontBold,
          ),
        ),
        centerTitle: true,
      ),
      body: const ProfileBody(),
    );
  }
}

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String name = 'John Doe Pragos';
  String email = 'johndoe@email.com';
  bool isEditingName = false;
  bool isEditingEmail = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = name;
    _emailController.text = email;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 32),
            _buildProfileImage(),
            const SizedBox(height: 32),
            _buildInfoSection(
              title: 'Nama Lengkap',
              value: name,
              isEditing: isEditingName,
              controller: _nameController,
              onEdit: (value) {
                setState(
                  () {
                    isEditingName = value;
                    if (!value) _nameController.text = name;
                  },
                );
              },
              onSave: () {
                if (_formKey.currentState!.validate()) {
                  setState(
                    () {
                      name = _nameController.text;
                      isEditingName = false;
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 32),
            _buildInfoSection(
              title: 'Email',
              value: email,
              isEditing: isEditingEmail,
              controller: _emailController,
              onEdit: (value) {
                setState(
                  () {
                    isEditingEmail = value;
                    if (!value) _emailController.text = email;
                  },
                );
              },
              onSave: () {
                if (_formKey.currentState!.validate()) {
                  setState(
                    () {
                      email = _emailController.text;
                      isEditingEmail = false;
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 32),
            _updatePassBtn(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 170,
          height: 170,
          decoration: const BoxDecoration(
            color: Color(0x66193E26),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              'JD',
              style: TextStyle(
                color: Color(0xFF193E26),
                fontSize: 96,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFFDFBA5B),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.edit, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection({
    required String title,
    required String value,
    required bool isEditing,
    required TextEditingController controller,
    required Function(bool) onEdit,
    required VoidCallback onSave,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          if (isEditing)
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFBC0000),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFBC0000),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '$title tidak boleh kosong';
                }
                return null;
              },
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF193E26),
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () => onEdit(true),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isEditing)
                Row(
                  children: [
                    TextButton(
                      onPressed: () => onEdit(false),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF193E26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: Color(0xFF193E26),
                          ),
                        ),
                      ),
                      child: const Text('Batal'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: onSave,
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF28653D),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Simpan'),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _updatePassBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Sandi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const EditPassPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.black.withOpacity(0.1),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Perbarui'),
          ),
        ],
      ),
    );
  }
}
