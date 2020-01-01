import 'package:flutter/material.dart';
import 'CustomIcon.dart';

class ProductCard extends StatelessWidget {
  int cardColor;
 String imgUrl;
  String title;

  ProductCard(
      this.cardColor,this.imgUrl, this.title,this.page);
      final Widget page;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: 140.0,
      decoration: BoxDecoration(
          color: Color(cardColor),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey.withOpacity(.3), width: .2)),
      child: GestureDetector(
        onTap: () => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => page),
),
              child: Column(
          children: <Widget>[
            SizedBox(
              height: 11.0,
            ),
            
              Image.asset(imgUrl, width: 141.0, height: 71.0),

            Text(title, style: TextStyle(fontSize: 25.0, fontFamily: "Raleway")),
            

            SizedBox(
              height: 11.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 
                  Column(
                    children: <Widget>[
                   
                      SizedBox(
                        height: 11.0,
                      ),
                    ],
                  ),
                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}