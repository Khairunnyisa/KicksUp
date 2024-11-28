import 'package:e_commerce/consts.dart';
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
  // controller: untuk mengakses sebuah text field
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              // key: sebagai lable untuk melakukan debugging
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultpadding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "Hi! Welcome back, you've been missed",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 70),
                      Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Colors.transparent), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled:
                                  true, // Aktifkan agar background terisi warna
                              fillColor: Color(0xFFF7F9FC),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20), // Warna background
                            ),
                            // melakukan validasi apakah value nya itu masuk atau tidak
                            validator: (value) {
                              // kalau misal value nya kosong, dia akan mereturn email is required
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              // kalo misalkan value itu akhiranya harus pake format gmail.com
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
                            decoration: InputDecoration(
                              labelText: "Password",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Colors.transparent), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled:
                                  true, // Aktifkan agar background terisi warna
                              fillColor: const Color(0xFFF7F9FC),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20), // Warna background
                            ),
                            // melakukan validasi apakah value nya itu masuk atau tidak
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            alignment: Alignment.centerRight, // Teks di kanan
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: primaryColor,
                                  color: primaryColor),
                            ),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            height: 42,
                            width: 320,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryColor),
                                ),
                                onPressed: () {
                                  // currentstate: ngambil state yg terbaru
                                  // validate: untuk validasi, apakah textfield nya itu ada error atau enggak
                                  if (_formKey.currentState!.validate()) {
                                    // if the validation success, it will navigate to home screen
                                    // membawawa dan mengganti data, gak memungkinkan untuk kembali ke halaman sebelumnya
                                    // context: representasi dari file yg aktif sekarang
                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                  }
                                },
                                child: const Text("Login",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text("Or sign in with"),
                      const SizedBox(height: 25),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 60, // Lebar lingkaran
                              height:
                                  60, // Tinggi lingkaran (sama dengan lebar untuk lingkaran)
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Warna background lingkaran
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/apple_logo.png'),
                                ), // Membuat bentuk bulat
                                border: Border.all(
                                  color: Colors.grey, // Warna outline
                                  width: 1.0, // Ketebalan outline
                                ),
                              ),
                              margin: const EdgeInsets.all(8.0)),
                          Container(
                              width: 60, // Lebar lingkaran
                              height:
                                  60, // Tinggi lingkaran (sama dengan lebar untuk lingkaran)
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Warna background lingkaran
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/google_logo.png'),
                                ), // Membuat bentuk bulat
                                border: Border.all(
                                  color: Colors.grey, // Warna outline
                                  width: 1.0, // Ketebalan outline
                                ),
                              ),
                              margin: const EdgeInsets.all(8.0)),
                          Container(
                              width: 60, // Lebar lingkaran
                              height:
                                  60, // Tinggi lingkaran (sama dengan lebar untuk lingkaran)
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Warna background lingkaran
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/facebook_logo.png'),
                                ), // Membuat bentuk bulat
                                border: Border.all(
                                  color: Colors.grey, // Warna outline
                                  width: 1.0, // Ketebalan outline
                                ),
                              ),
                              margin: const EdgeInsets.all(8.0))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            "Belum punya akun? daftar disini",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF909FB4)),
                          ))
                    ]),
              )),
        ),
      ),
    );
  }
}
