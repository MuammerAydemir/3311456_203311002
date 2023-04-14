import 'package:flutter/material.dart';
import 'package:meal/data/Colors.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({
    super.key,
  });

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  String e_mail = "";
  String passwd = "";
  SnackBar snackBar = const SnackBar(content: Text("Hatalı Giriş"));

  void control() {
    if (e_mail == null && passwd == null) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (e_mail == "admin@mail.com" && passwd == "1234") {
      Navigator.pushNamed(context, "/BarNavigation");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool buttonPSV = true;
    if (e_mail == "admin@mail.com" && passwd == "1234") {
      buttonPSV = false;
    } else {
      buttonPSV = true;
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: white, elevation: 0, actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/About"),
              icon: Icon(
                Icons.info_outline,
                color: black,
              )),
        ]),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                onChanged: (value) {
                                  e_mail = value;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.alternate_email),
                                  labelText: "E-mail",
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: grey,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: grey)),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                onChanged: (value) {
                                  passwd = value;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  labelText: "Password",
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: grey,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: grey)),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: buttonPSV ? null : () => control(),
                          style: ElevatedButton.styleFrom(
                            shadowColor: black,
                            backgroundColor: main4Color,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                          ),
                          child: Text(
                            "Sign in",
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
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                        color: const Color(0xFF1AE821),
                      )
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Create New Account"),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, "/Sign_up"),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),
                      ],
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
}
