import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 29,
          ),
          color: Colors.black,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 18.0),
              child: Text("CURRENT DEVICE" , style: GoogleFonts.openSans(fontWeight: FontWeight.w700 , color: Colors.grey[800]),),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text("DUMMY PHONE" , style: GoogleFonts.openSans(fontSize: 15 , fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Active now" , style: GoogleFonts.openSans(color: Colors.grey[600]),),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 10.0),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "LOGOUT",
                          style: GoogleFonts.openSans(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w900),
                        )),
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
