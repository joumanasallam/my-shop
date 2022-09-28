import 'package:flutter/material.dart';
import 'package:shopping/modules/login.dart';

import '../shared/components/components.dart';
import '../shared/styles/style.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://img.freepik.com/free-photo/beautiful-black-white-girl-portrait_158538-8380.jpg?w=360&t=st=1661096689~exp=1661097289~hmac=a9b5fa9fd999c986aeed819ec7ae5bd4ae50f9f84963581c7d126837f3c0e059"))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 350, 0, 0),
        child: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(30),
            gradient: LinearGradient(
              colors: [
                Colors.purple[900]!.withOpacity(0.9),
                Colors.purple.withOpacity(0.7)
              ],
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: txtrow("MY", "SHOP", 50)),
            Text(
              "enjoy in our application",
              style: style3,
            ),
            Padding(
                padding: const EdgeInsets.all(40.0),
                child: button(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return Login();
                  }));
                }, "Get Start", 25))
          ]),
        ),
      ),
    ));
  }
}
