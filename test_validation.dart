import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to manage input data
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cnicController = TextEditingController();
  final _contactController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  // Validation functions
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name should contain only alphabetic characters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validateCNIC(String? value) {
    if (value == null || value.isEmpty) {
      return 'CNIC cannot be empty';
    } else if (!RegExp(r'^\d{13}$').hasMatch(value)) {
      return 'CNIC should be exactly 13 digits';
    }
    return null;
  }

  String? _validateContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Contact number cannot be empty';
    } else if (!RegExp(r'^\d{10,12}$').hasMatch(value)) {
      return 'Contact number should be 10-12 digits';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address cannot be empty';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password should be at least 8 characters';
    } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$').hasMatch(value)) {
      return 'Password must contain letters, numbers, and symbols';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: _validateName,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: _validateEmail,
              ),
              TextFormField(
                controller: _cnicController,
                decoration: const InputDecoration(labelText: 'CNIC (13 digits)'),
                keyboardType: TextInputType.number,
                validator: _validateCNIC,
              ),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.number,
                validator: _validateContact,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: _validateAddress,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: _validatePassword,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    // If the form is valid, display a success message or proceed with further processing
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form Submitted Successfully!')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
