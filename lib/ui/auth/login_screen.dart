import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({super.key});

  // menandakan kalau kita mau melakukan sebuah action yg penting
  // key: sebuah petanda kalau dia itu bisa dipanggil
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            // key: sebagai lable untuk melakukan debugging
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                // melakukan validasi apakah value nya itu masuk atau tidak
                validator: (value) {
                  // kalau misal value nya kosong, dia akan mereturn email is required
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  // kalo misalkan value itu akhiranya gmail.com. kalau ada ini, dia negasi nya
                  // note itu artinya positif
                  if (!value.endsWith("gmail.com")) {
                    return "Please fill with valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                // ngebuat teks nya jadi berbentuk bintang
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  // ini perpindahan
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // if the validation success, it will navigate to home screen
                      // membawawa dan mengganti data, gak memungkinkan untuk kembali ke halaman sebelumnya
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                  child: const Text("Login")),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text("Belum punya akun? daftar disini"))
            ])),
      ),
    );
  }
}
