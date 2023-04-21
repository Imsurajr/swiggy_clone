import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swiggy_clone/screens/details_edit.dart';
import 'package:swiggy_clone/screens/logout_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Elon",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "+91 - 1234567890  ·  elon@gmail.com",
                        style: GoogleFonts.notoSansAnatolianHieroglyphs(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsEdit()));
                    },
                    child: Text(
                      "EDIT",
                      style: GoogleFonts.openSans(
                        color: Colors.orange[900],
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.black,
              height: 2,
              width: MediaQuery.of(context).size.width * 0.90,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Text(
                    "one ",
                    style: GoogleFonts.openSans(
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                  Text(
                    "membership",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "Free Delivery & Exclusive Discounts on Food, Groceries, Dineout & Genie. Buy Now   ",
                            style: GoogleFonts.openSans()),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //todo
                    },
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey[700],
              height: 1,
              width: MediaQuery.of(context).size.width * 0.90,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("My Account",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("Favourites, Hidden restaurants & Settings",
                          style: GoogleFonts.openSans()),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      //todo
                    },
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey[700],
              height: 1,
              width: MediaQuery.of(context).size.width * 0.90,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Addresses",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("Share, Edit & Add New Addresses",
                          style: GoogleFonts.openSans()),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      //todo
                    },
                    icon: Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey[700],
              height: 1,
              width: MediaQuery.of(context).size.width * 0.90,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Payments & Refunds",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("Refund Status & Payment Modes",
                          style: GoogleFonts.openSans()),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      //todo
                    },
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey[700],
              height: 1,
              width: MediaQuery.of(context).size.width * 0.90,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Refer & Earn Program",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          Text("Refer friends and earn ₹500 cashback on Swiggy",
                              style: GoogleFonts.openSans()),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          //todo
                        },
                        icon: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "🎁",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Did you know?",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(
                                "You get ₹50 every time your friend places the first order",
                                style: GoogleFonts.openSans(),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.grey[700],
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.90,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Help",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("FAQs & Links", style: GoogleFonts.openSans()),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      //todo
                    },
                    icon: Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
                    child: Text(
                      "Past orders",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("XYZ Restaurant",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text("Delivered ✅ ",
                                  style: GoogleFonts.openSans()),
                            ],
                          ),
                          Text(
                            "Indore",
                            style: GoogleFonts.openSans(
                              color: Colors.grey[700],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹xyz",
                                style: GoogleFonts.openSans(
                                  color: Colors.grey[700],
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey[700],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                  ".........................................................................................."),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Large Size Pizza  (1)",
                                style: GoogleFonts.openSans(
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                "January 1, 04:0 PM",
                                style: GoogleFonts.openSans(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * 0.42,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "REORDER",
                                    style: GoogleFonts.openSans(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.orange,
                                    width: 1.5,
                                  ),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * 0.42,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "RATE ORDER",
                                    style: GoogleFonts.openSans(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image(
                            image: AssetImage("images/image17.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.grey[700],
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.90,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("YZX Restaurant",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text("Delivered ✅ ",
                                  style: GoogleFonts.openSans()),
                            ],
                          ),
                          Text(
                            "Indore",
                            style: GoogleFonts.openSans(
                              color: Colors.grey[700],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹abc",
                                style: GoogleFonts.openSans(
                                  color: Colors.grey[700],
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey[700],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                  ".........................................................................................."),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cheese Burger  (1)",
                                style: GoogleFonts.openSans(
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                "February 1, 04:0 PM",
                                style: GoogleFonts.openSans(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.5,
                                      ),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: Column(
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "REORDER",
                                            style: GoogleFonts.openSans(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      "You haven't rated this delivery yet",
                                      style: GoogleFonts.openSans(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.orange,
                                        width: 1.5,
                                      ),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "RATE ORDER",
                                        style: GoogleFonts.openSans(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      "You haven't rated this food yet",
                                      style: GoogleFonts.openSans(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.grey[700],
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.90,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("OMG Restaurant",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text("Delivered ✅ ",
                                  style: GoogleFonts.openSans()),
                            ],
                          ),
                          Text(
                            "Indore",
                            style: GoogleFonts.openSans(
                              color: Colors.grey[700],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹999",
                                style: GoogleFonts.openSans(
                                  color: Colors.grey[700],
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey[700],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                  ".........................................................................................."),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cheese Burger  (7)",
                                style: GoogleFonts.openSans(
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                "February 1, 04:0 PM",
                                style: GoogleFonts.openSans(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.5,
                                      ),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: Column(
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "REORDER",
                                            style: GoogleFonts.openSans(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      "You haven't rated this delivery yet",
                                      style: GoogleFonts.openSans(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.orange,
                                        width: 1.5,
                                      ),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "RATE ORDER",
                                        style: GoogleFonts.openSans(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      "You haven't rated this food yet",
                                      style: GoogleFonts.openSans(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.grey[700],
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.90,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "VIEW MORE ORDERS",
                                style: GoogleFonts.openSans(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w900),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogoutScreen()),);
                    },
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "LOGOUT OPTIONS",
                              style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Center(child:  Text(
                    "App version 1.0.0(1111)",
                    style: GoogleFonts.openSans(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.20)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
