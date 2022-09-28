import 'package:flutter/material.dart';
import 'package:shopping/layout/home_screen.dart';
import 'package:shopping/shared/components/components.dart';
import 'package:shopping/shared/styles/style.dart';

// ignore: must_be_immutable
class Verification extends StatelessWidget {
  String number;
  var formkey = GlobalKey<FormState>();
  Verification(this.number, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          topwidget("Virification Code"),
          const SizedBox(
            height: 30,
          ),
          maintext("Enter verification code send to"),
          Text(number, style: style6),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: formkey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(children: [
                  deftextfiled(),
                  const SizedBox(
                    width: 10,
                  ),
                  deftextfiled(),
                  const SizedBox(
                    width: 10,
                  ),
                  deftextfiled(),
                  const SizedBox(
                    width: 10,
                  ),
                  deftextfiled(),
                ]),
              ),
            ),
          ),
          button(() {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return const Home();
            }));
            if (formkey.currentState!.validate()) {
              // ignore: avoid_print
              print("done");
            }
            
          }, "Continue ", 18),
          const SizedBox(
            height: 30,
          ),
          downtxt("RESEND CODE", () {})
        ]),
      ),
    );
  }
}
