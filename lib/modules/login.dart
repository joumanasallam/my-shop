import 'package:flutter/material.dart';
import 'package:shopping/modules/verification_screen.dart';

import '../shared/components/components.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  dynamic data;
  var formkey = GlobalKey<FormState>();

  Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          topwidget("What is your phone number?"),
          const SizedBox(height: 30),
          maintext("Enter your phone number"),
          const SizedBox(height: 30),
          Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextFormField(
                  maxLength: 11,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hoverColor: Colors.purple,
                      prefixText: "+20",
                      hintText: "Enter your number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onFieldSubmitted: (value) {
                    data = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    }
                    return null;
                  }),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          button(() {
            if (formkey.currentState!.validate()) {
              // ignore: avoid_print
              print(data);
              navigator(context, Verification(data));
            }
          }, "send verification code ", 18),
          const SizedBox(
            height: 30,
          ),
          downtxt("SKIP", () {})
        ]),
      ),
    );
  }
}
