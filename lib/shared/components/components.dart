import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../styles/style.dart';

Widget txtrow(String t1, String t2, double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(t1, style: TextStyle(color: Colors.yellow, fontSize: size)),
      Text(t2, style: TextStyle(color: Colors.white, fontSize: size)),
    ],
  );
}

Widget productWidget(String imgurl, var icon, dynamic ratingvalue,
    String productname, int price) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imgurl),
          )),
          child: Container(
            width: 10,
            height: 10,
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Icon(
                icon,
                color: Colors.orange,
              ),
            ),
          )),
      Row(
        children: [
          RatingBar(
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 15.0,
              ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 3.0,
                  ),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.orange,
                    size: 3.0,
                  ),
                  empty: const Icon(
                    Icons.star_outline,
                    color: Colors.orange,
                    size: 3.0,
                  )),
              onRatingUpdate: (value) {
                ratingvalue = value;
              })
        ],
      ),
      Text(productname),
      Text("$price" "LE"),
    ],
  );
}

Widget topwidget(String title) {
  return Container(
    height: 200,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(200),
      ),
      gradient: LinearGradient(
        colors: [
          Colors.purple[900]!.withOpacity(0.9),
          Colors.purple.withOpacity(0.7)
        ],
      ),
    ),
    child: Center(
        child: Text(
      title,
      style: style3,
    )),
  );
}

Widget button(dynamic f1, String text, double size) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(30),
    ),
    child: MaterialButton(
      onPressed: f1,
      color: Colors.yellow[400],
      minWidth: 300,
      height: 60,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Text(text,
          style: TextStyle(color: Colors.deepPurple, fontSize: size)),
    ),
  );
}

Widget maintext(String text) {
  return Text(
    text,
    style: style5,
  );
}

void navigator(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return widget;
  }));
}

Widget deftextfiled() {
  return SizedBox(
      width: 70,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: TextFormField(
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.center,
            cursorColor: Colors.deepPurple,
            decoration: InputDecoration(
                floatingLabelStyle: style5,
                counterText: '',
                hintStyle:
                    const TextStyle(color: Colors.black, fontSize: 20.0)),
            maxLength: 1,
            validator: (value) {
              if (value!.isEmpty) {
                return "*";
              }
              return null;
            }),
      ));
}

Widget downtxt(String title, dynamic fun) {
  return InkWell(
      onTap: fun,
      child: (Text(
        title,
        style: style5,
      )));
}
