import 'package:flutter/material.dart';
import 'package:meal/data/Colors.dart';
import 'package:meal/data/userInfo.dart';
import 'package:meal/pages/profile.dart';

class Sign_up extends StatefulWidget {
  Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  void submitForm() {
    if (formKey.currentState!.validate()) {
      final user = User(
        name: nameController.text,
        email: emailController.text,
          password: passwdController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(user: user),
        ),
      );
    }
  }
  @override
  void initState() {
    nameController=TextEditingController();
    emailController=TextEditingController();
    passwdController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwdController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: black,
              ),
              onPressed: () => Navigator.pop(context)),
          backgroundColor: white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an Account",
                            style: TextStyle(
                              fontSize: 15,
                              color: grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: nameController,
                              decoration: textFieldDec(Icons.badge_outlined, "Name"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: textFieldDec(Icons.alternate_email, "E-mail"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the e-mail';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: passwdController,
                              obscureText: true,
                              decoration: textFieldDec(Icons.lock_outline, "Password"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the password';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: submitForm,
                            style: ElevatedButton.styleFrom(
                              shadowColor: black,
                              backgroundColor: main4Color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => Navigator.pushNamed(context, "/"),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

textFieldDec(var icon, var label) => InputDecoration(
      prefixIcon: Icon(icon),
      labelText: "$label",
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: grey,
        ),
      ),
      border: OutlineInputBorder(borderSide: BorderSide(color: grey)),
    );



