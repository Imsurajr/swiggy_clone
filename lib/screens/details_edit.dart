import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsEdit extends StatelessWidget {
  const DetailsEdit({Key? key}) : super(key: key);

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
        title: Text("EDIT ACCOUNT" , style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 15,
        ),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name" , style: GoogleFonts.openSans( color: Colors.grey[500] , fontWeight: FontWeight.w600), ),
                      SizedBox(height: 3,),
                      Text("Elon" , style: GoogleFonts.openSans( color: Colors.grey[600] , fontSize: 17 ,fontWeight: FontWeight.bold), ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Colors.grey[500],
                height: 1,
                width: MediaQuery.of(context).size.width * 0.90,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PHONE NUMBER" , style: GoogleFonts.openSans( color: Colors.grey[500] , fontWeight: FontWeight.w600), ),
                      SizedBox(height: 3,),
                      Text("9876543218" , style: GoogleFonts.openSans( color: Colors.grey[600] , fontSize: 17 ,fontWeight: FontWeight.bold), ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Colors.grey[500],
                height: 1,
                width: MediaQuery.of(context).size.width * 0.90,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("EMAIL ADDRESS" , style: GoogleFonts.openSans( color: Colors.grey[500] , fontWeight: FontWeight.w600), ),
                      SizedBox(height: 3,),
                      Text("elon@gmail.com" , style: GoogleFonts.openSans( color: Colors.grey[600] , fontSize: 17 ,fontWeight: FontWeight.bold), ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Colors.grey[500],
                height: 1,
                width: MediaQuery.of(context).size.width * 0.90,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
