import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // Variabel ini digunakan untuk mengatur dan menampilkan toast notifications.
  late FToast fToast; // Deklarasi FToast

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    // Menginisialisasi objek FToast dengan konteks saat ini agar dapat menampilkan toast.
    fToast.init(context);
  }

  // Metode ini bertugas untuk membuat dan menampilkan toast.

  void _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 15.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "Fill Your Information Below",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 70),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Colors.transparent), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true, // Aktifkan agar background terisi warna
                    fillColor: Color(0xFFF7F9FC),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20), // Warna background
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Colors.transparent), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true, // Aktifkan agar background terisi warna
                    fillColor: Color(0xFFF7F9FC),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20), // Warna background
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!value.endsWith("@gmail.com")) {
                      return "Please fill with valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Colors.transparent), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true, // Aktifkan agar background terisi warna
                    fillColor: Color(0xFFF7F9FC),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20), // Warna background
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
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
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      child: const Text("Daftar",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ))),
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
                          color: Colors.white, // Warna background lingkaran
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/apple_logo.png'),
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
                          color: Colors.white, // Warna background lingkaran
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/google_logo.png'),
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
                          color: Colors.white, // Warna background lingkaran
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/facebook_logo.png'),
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
                      Navigator.pushNamed(context, '/login-screen');
                    },
                    child: const Text(
                      "Belum punya akun? daftar disini",
                      style: TextStyle(fontSize: 16, color: Color(0xFF909FB4)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
