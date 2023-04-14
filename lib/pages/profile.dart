import 'package:flutter/material.dart';
import 'package:meal/data/Colors.dart';
import 'package:meal/data/userInfo.dart';
import 'package:meal/pages/sign_up.dart';

class Profile extends StatefulWidget {
  final User? user;

  const Profile({this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var avatarImg = "https://www.w3schools.com/howto/img_avatar.png";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Profile"),
          ),
          body: SingleChildScrollView(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(avatarImg),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              profileCard(widget.user!.name),
                              const SizedBox(height: 30,),
                              profileCard(widget.user!.email),
                              const SizedBox(height: 30,),
                              masked(widget.user!.password),
                            ],
                          ))
                    ],
                  )),
                )
              ),
    );
  }

  Widget masked(String masked) {
    String mask="*"*masked.length;
    return profileCard(mask);
  }
}

Widget profileCard(var text) {
  return Card(
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(text,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.normal),),
      const Icon(Icons.arrow_right,size: 30,),
    ]),
  );
}
