import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swiggy_clone/screens/profile_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../modals/carousel_slider.dart';
import 'clicked.dart';
import 'home_screen.dart';
import 'location_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int currentIndex = 1;
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      setState(() {});
    });

    super.initState();
    _videoPlayerController = VideoPlayerController.asset('videos/video1.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      maxScale: 5,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      showControls: false,
      fullScreenByDefault: false,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _chewieController.dispose();
    _videoPlayerController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LocationScreen()),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.navigation,
                    color: Colors.orange[900],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Others",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  )
                ],
              ),
              //todo location
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shape: StadiumBorder(),
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Text(
                          "BUY",
                          style: GoogleFonts.notoSansAnatolianHieroglyphs(
                              fontSize: 10,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "One",
                          style: GoogleFonts.sourceCodePro(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: CircleBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children:
       [ SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for dishes, restaurants',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey[600],
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          height: 20,
                          width: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.mic_rounded,
                            color: Colors.orange[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    width:  double.infinity,
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: Chewie(controller: _chewieController),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Clicked()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ImageCarousel(
                              imageUrls: [
                                "images/foodpageimage13.jpg",
                                "images/foodpageimage11.jpg",
                                "images/foodpageimage14.jpg",
                                "images/foodpageimage12.jpg",
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Top rated near you",
                      style: GoogleFonts.jost(
                          fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp13.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                left: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.35,
                                  height: MediaQuery.of(context).size.height *
                                      0.14,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "40% off on Dominos",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "upto ₹100",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Domino's Pizza",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.5 · 20 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp12.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                left: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "20% off",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Text(
                                  "upto ₹50",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "MoChina",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.3 · 13 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp11.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                left: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.16,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "60% off on Apna Sweet",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "ABOVE ₹250",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Apna Sweets",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.7 · 33 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp14.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                left: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "30% off ",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "free delivery",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Burgerrrr",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                Text(
                                  "3.2 · 30 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp15.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                left: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.34,
                                  height: MediaQuery.of(context).size.height *
                                      0.14,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 5),
                                    child: Text(
                                      "FLAT DEAL ₹250 off",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "Above ₹400",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Fingers",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.red[900], fontSize: 20),
                                ),
                                Text(
                                  "2.1 · 23 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp16.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Healtyfy",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.6 · 8 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp17.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                left: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "49% off",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "UPTO ₹50",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Top End",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                Text(
                                  "3.1 · 26 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp18.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                left: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.11,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "FREE DELIVERY",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "ABOVE ₹150",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "The Noms",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.1 · 17 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp19.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 5,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  color: Colors.black45,
                                  child: Text(
                                    "30% off",
                                    style: GoogleFonts.notoSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "BurDay",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                Text(
                                  "2.9 · 30 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp20.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "NOLEN GS",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.2 · 21 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.25),
                child: Text(
                  "Elon, what's on your mind? ",
                  style: GoogleFonts.jost(
                      fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Clicked()),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("images/rowelems11.jpg"),
                        ),
                        Image(
                          image: AssetImage("images/rowelems12.jpg"),
                        ),
                        Image(
                          image: AssetImage("images/rowelems13.jpg"),
                        ),
                        Image(
                          image: AssetImage("images/rowelems14.jpg"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.40),
                child: Text(
                  "Explore as you like",
                  style: GoogleFonts.jost(
                      fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image(
                image: AssetImage("images/offers.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.45),
                child: Text(
                  "30 mins or less!",
                  style: GoogleFonts.jost(
                      fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image:
                                        AssetImage("images/30minfood12.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1,
                                bottom: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "40% off",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "upto ₹50",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "The Grilled Trip",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.1 · 26 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image:
                                        AssetImage("images/30minfood13.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1,
                                bottom: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "20% off",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "upto ₹50",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "BKing",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.3 · 13 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image:
                                        AssetImage("images/30minfood14.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1,
                                bottom: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "60% off ",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "UPTO ₹50",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Veg Bites",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.2 · 23 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image:
                                        AssetImage("images/30minfood15.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1,
                                bottom: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "20% off",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "UPTO ₹75",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "LickIt",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.7 · 10 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image:
                                        AssetImage("images/30minfood14.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1,
                                bottom: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "33% off ",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 4,
                                left: 8,
                                child: Text(
                                  "UPTO ₹60",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "New Veggies",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                Text(
                                  "2.3 · 28 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp13.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1,
                                bottom: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "40% off",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 3,
                                left: 8,
                                child: Text(
                                  "UPTO ₹100",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Domino's Pizza",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.5 · 20 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image:
                                        AssetImage("images/30minfood16.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1,
                                bottom: 5,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "20% off",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 10,
                                child: Text(
                                  "UPTO ₹120",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Proper Non",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.1 · 20 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image:
                                        AssetImage("images/30minfood17.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 3,
                                bottom: 5,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "25% off ",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 10,
                                child: Text(
                                  "UPTO ₹70",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Chick and Chap",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.red[800], fontSize: 20),
                                ),
                                Text(
                                  "2.7 · 23 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image:
                                        AssetImage("images/30minfood18.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "11% off",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 2,
                                left: 8,
                                child: Text(
                                  "UPTO ₹88",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Proper Indie",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "3.9 · 26 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage("images/rowp12.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 2,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "20% off",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 8,
                                child: Text(
                                  "upto ₹50",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "MoChina",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.3 · 13 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image:
                                        AssetImage("images/30minfood19.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 2,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "26% off ",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                child: Text(
                                  "UPTO ₹26",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Cheese Pull",
                              style: GoogleFonts.notoSans(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 20),
                                ),
                                Text(
                                  "4.3 · 23 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Filter ",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Icon(
                                  Icons.filter_alt_outlined,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sort by ",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Fast Delivery ",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cuisins",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "New on Swiggy",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Ratings 4.0+",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Pure Veg",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Offers",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rs. 300-Rs. 600",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "< Rs. 300",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.20),
                child: Text(
                  "334 restaurants to explore      ",
                  style: GoogleFonts.jost(
                      fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height:
                                  MediaQuery.of(context).size.height * 0.22,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                  image:
                                      AssetImage("images/30minfood14.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "Cheese Pull",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Row(
                                  children: [
                                    Text(
                                      "✪  ",
                                      style: TextStyle(
                                          color: Colors.green[800],
                                          fontSize: 25),
                                    ),
                                    Text(
                                      "4.3 · 23 mins",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 17),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Punjabi, Chinese, Italian, Thalis",
                                      style: GoogleFonts.jost(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400,
                                      ),
                                      //todo : height reduce sbki
                                    ),
                                    Text(
                                      "New Palasia · 0.1 km",
                                      style: GoogleFonts.jost(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height *
                                            0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "FREE DELIVERY",
                                          style: GoogleFonts.openSans(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0, top: 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                "One",
                                                style: GoogleFonts.openSans(
                                                  fontSize: 17,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              Text(
                                                "BENEFITS",
                                                style: GoogleFonts.openSans(
                                                  fontSize: 9,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.045,
                        bottom: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "60% off ",
                              style: GoogleFonts.notoSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 23,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "UPTO ₹50",
                            style: GoogleFonts.notoSans(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height:
                                  MediaQuery.of(context).size.height * 0.22,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                  image:
                                      AssetImage("images/30minfood16.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "Shree Gurukripa",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Row(
                                  children: [
                                    Text(
                                      "✪  ",
                                      style: TextStyle(
                                          color: Colors.green[800],
                                          fontSize: 25),
                                    ),
                                    Text(
                                      "4.1· 13 mins",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 17),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "North Indian, Thalis, South Indian, ",
                                      style: GoogleFonts.jost(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Vijay Nagar · 4.3 km",
                                      style: GoogleFonts.jost(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height *
                                            0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "EXTRA 10% OFF",
                                              style: GoogleFonts.openSans(
                                                fontSize: 15,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "AND FREE DELIVERY",
                                              style: GoogleFonts.openSans(
                                                fontSize: 10,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0, top: 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                "One",
                                                style: GoogleFonts.openSans(
                                                  fontSize: 17,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              Text(
                                                "BENEFITS",
                                                style: GoogleFonts.openSans(
                                                  fontSize: 9,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.045,
                        bottom: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "40% off ",
                              style: GoogleFonts.notoSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 23,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "UPTO ₹120",
                            style: GoogleFonts.notoSans(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height:
                                  MediaQuery.of(context).size.height * 0.22,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                  image:
                                      AssetImage("images/30minfood15.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "The Good Bowl",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Row(
                                  children: [
                                    Text(
                                      "✪  ",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 25),
                                    ),
                                    Text(
                                      "2.7· 33 mins",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 17),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "South Indian, Thalis, Punjabi , ",
                                      style: GoogleFonts.jost(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Sheetal Nagar · 2.8 km",
                                      style: GoogleFonts.jost(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height *
                                            0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "EXTRA 15% OFF",
                                              style: GoogleFonts.openSans(
                                                fontSize: 15,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "AND FREE DELIVERY",
                                              style: GoogleFonts.openSans(
                                                fontSize: 10,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0, top: 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                "One",
                                                style: GoogleFonts.openSans(
                                                  fontSize: 17,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              Text(
                                                "BENEFITS",
                                                style: GoogleFonts.openSans(
                                                  fontSize: 9,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.045,
                        bottom: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "40% off ",
                              style: GoogleFonts.notoSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 23,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "UPTO ₹120",
                            style: GoogleFonts.notoSans(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height:
                                  MediaQuery.of(context).size.height * 0.22,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                  image:
                                      AssetImage("images/30minfood14.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "Cheese Pull",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Row(
                                  children: [
                                    Text(
                                      "✪  ",
                                      style: TextStyle(
                                          color: Colors.green[800],
                                          fontSize: 25),
                                    ),
                                    Text(
                                      "4.3 · 23 mins",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 17),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Punjabi, Chinese, Italian, Thalis",
                                      style: GoogleFonts.jost(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "New Palasia · 0.1 km",
                                      style: GoogleFonts.jost(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height *
                                            0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "FREE DELIVERY",
                                          style: GoogleFonts.openSans(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0, top: 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                "One",
                                                style: GoogleFonts.openSans(
                                                  fontSize: 17,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              Text(
                                                "BENEFITS",
                                                style: GoogleFonts.openSans(
                                                  fontSize: 9,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.045,
                        bottom: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "60% off ",
                              style: GoogleFonts.notoSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 23,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "UPTO ₹50",
                            style: GoogleFonts.notoSans(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                color: Color(0xff022E1F),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.39,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 12),
                          child: Text(
                            "Popular Brands",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.35,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.18,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            image: AssetImage(
                                                "images/rowp11.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 1,
                                        left: 1,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.16,
                                          decoration: BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "60% off on Apna Sweet",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 8,
                                        child: Text(
                                          "ABOVE ₹250",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Apna Sweets",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "✪  ",
                                            style: TextStyle(
                                                color: Colors.green[800],
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "4.7 · 33 mins",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Sweets, Beverages, Thalis, ",
                                        style: GoogleFonts.jost(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.35,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.18,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            image: AssetImage(
                                                "images/rowp12.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 1,
                                        left: 1,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "40% off ",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 8,
                                        child: Text(
                                          "ABOVE ₹80",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sam's Nachos",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "✪  ",
                                            style: TextStyle(
                                                color: Colors.green[800],
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "4.3 · 21 mins",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "100 types of Nachos ",
                                        style: GoogleFonts.jost(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.35,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.18,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            image: AssetImage(
                                                "images/rowp15.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 1,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "10% off",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 8,
                                        child: Text(
                                          "ABOVE ₹100",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Red Chilli",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "✪  ",
                                            style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "2.9 · 23 mins",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Pizza ,Sweets, Beverages, , ",
                                        style: GoogleFonts.jost(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.35,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.18,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            image: AssetImage(
                                                "images/rowp19.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 1,
                                        left: 1,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "33% off",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 8,
                                        child: Text(
                                          "ABOVE ₹120",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Big Burger",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "✪  ",
                                            style: TextStyle(
                                                color: Colors.green[800],
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "3.7 · 26 mins",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Burger, Pasta ",
                                        style: GoogleFonts.jost(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.35,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.18,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            image: AssetImage(
                                                "images/30minfood13.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 1,
                                        left: 1,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "20% off",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 8,
                                        child: Text(
                                          "ABOVE ₹100",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Fast Food Corner",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "✪  ",
                                            style: TextStyle(
                                                color: Colors.green[800],
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "4.7 · 33 mins",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Pizza, Burger, Pasta, ",
                                        style: GoogleFonts.jost(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.35,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.18,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            image: AssetImage(
                                                "images/30minfood16.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 1,
                                        left: 1,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "10% off ",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 8,
                                        child: Text(
                                          "ABOVE ₹110",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Chick Leg",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "✪  ",
                                            style: TextStyle(
                                                color: Colors.red[800],
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "1.7 · 43 mins",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Chiken and Kabab ",
                                        style: GoogleFonts.jost(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
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
              Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: AssetImage("images/30minfood17.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              "Chick and Chap Pull",
                              style: GoogleFonts.notoSans(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 25),
                                ),
                                Text(
                                  "3.9 · 23 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Chicken, Punjabi chicken",
                                  style: GoogleFonts.jost(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Mg Road · 1.2 km",
                                  style: GoogleFonts.jost(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width:
                                    MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "FREE DELIVERY",
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 8.0, top: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            "One",
                                            style: GoogleFonts.openSans(
                                              fontSize: 17,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            "BENEFITS",
                                            style: GoogleFonts.openSans(
                                              fontSize: 9,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.045,
                    bottom: 12,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "20% off ",
                          style: GoogleFonts.notoSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 23,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "UPTO ₹80",
                        style: GoogleFonts.notoSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: AssetImage("images/30minfood16.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              "Pure Non",
                              style: GoogleFonts.notoSans(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 25),
                                ),
                                Text(
                                  "4.0 · 13 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Non Veg",
                                  style: GoogleFonts.jost(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "South Tukoganj · 1.6 km",
                                  style: GoogleFonts.jost(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width:
                                    MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "FREE DELIVERY",
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 8.0, top: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            "One",
                                            style: GoogleFonts.openSans(
                                              fontSize: 17,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            "BENEFITS",
                                            style: GoogleFonts.openSans(
                                              fontSize: 9,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.045,
                    bottom: 12,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "15% off ",
                          style: GoogleFonts.notoSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 23,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "UPTO ₹150",
                        style: GoogleFonts.notoSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: AssetImage("images/30minfood19.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              "Cheese Pull",
                              style: GoogleFonts.notoSans(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 25),
                                ),
                                Text(
                                  "4.7 · 32 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "50 types of Pizza",
                                  style: GoogleFonts.jost(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Old Palasia · 7.0 km",
                                  style: GoogleFonts.jost(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width:
                                    MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "FREE DELIVERY",
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 8.0, top: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            "One",
                                            style: GoogleFonts.openSans(
                                              fontSize: 17,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            "BENEFITS",
                                            style: GoogleFonts.openSans(
                                              fontSize: 9,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.045,
                    bottom: 12,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "6% off ",
                          style: GoogleFonts.notoSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 23,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "UPTO ₹50",
                        style: GoogleFonts.notoSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: AssetImage("images/30minfood18.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              "Best Chinese ",
                              style: GoogleFonts.notoSans(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 25),
                                ),
                                Text(
                                  "3.7 · 21 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Noodles, Chawmine, Manchurian ",
                                  style: GoogleFonts.jost(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "One Center 93 · 0.2 km",
                                  style: GoogleFonts.jost(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width:
                                    MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "FREE DELIVERY",
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 8.0, top: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            "One",
                                            style: GoogleFonts.openSans(
                                              fontSize: 17,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            "BENEFITS",
                                            style: GoogleFonts.openSans(
                                              fontSize: 9,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.045,
                    bottom: 12,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "20% off ",
                          style: GoogleFonts.notoSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 23,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "UPTO ₹75",
                        style: GoogleFonts.notoSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Color(0xff270000),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.39,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 12),
                          child: Text(
                            "Because You Ordered \"PIZZA\"",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.35,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.18,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            image: AssetImage(
                                                "images/pizza1.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "FREE ITEM",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 8,
                                        child: Text(
                                          "ABOVE ₹300",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "LA PINO'Z",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "✪  ",
                                            style: TextStyle(
                                                color: Colors.green[800],
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "4.8 · 32 mins",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "BEST PIZZA FORREAL ",
                                        style: GoogleFonts.jost(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.35,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.18,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            image: AssetImage(
                                                "images/pizza2.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 1,
                                        left: 1,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "20% off ",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 8,
                                        child: Text(
                                          "ABOVE ₹120",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pizza Hut",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "✪  ",
                                            style: TextStyle(
                                                color: Colors.green[800],
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "4.4 · 19 mins",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "YOU KNOW US ",
                                        style: GoogleFonts.jost(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.35,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.18,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            image: AssetImage(
                                                "images/pizza3.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 1,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "10% off",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 8,
                                        child: Text(
                                          "ABOVE ₹100",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Oven Story Pizza",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "✪  ",
                                            style: TextStyle(
                                                color: Colors.green[800],
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "4.2 · 19 mins",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Pizza and Love",
                                        style: GoogleFonts.jost(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.35,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.18,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            image: AssetImage(
                                                "images/rowp13.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 1,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "20% off",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 8,
                                        child: Text(
                                          "ABOVE ₹120",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Domino's Pizza",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "✪  ",
                                            style: TextStyle(
                                                color: Colors.green[800],
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "4.7 · 13 mins",
                                            style: GoogleFonts.notoSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "The Best Pizza ITW",
                                        style: GoogleFonts.jost(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
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
              Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: AssetImage("images/30minfood11.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              "Veggies",
                              style: GoogleFonts.notoSans(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                Text(
                                  "✪  ",
                                  style: TextStyle(
                                      color: Colors.red[800], fontSize: 25),
                                ),
                                Text(
                                  "2.0 · 13 mins",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Non Veg",
                                  style: GoogleFonts.jost(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "South North · 1.9 km",
                                  style: GoogleFonts.jost(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width:
                                    MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "FREE DELIVERY",
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 8.0, top: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            "One",
                                            style: GoogleFonts.openSans(
                                              fontSize: 17,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            "BENEFITS",
                                            style: GoogleFonts.openSans(
                                              fontSize: 9,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.045,
                    bottom: 12,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "15% off ",
                          style: GoogleFonts.notoSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 23,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "UPTO ₹80",
                        style: GoogleFonts.notoSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Text(
                      "Live",
                      style: GoogleFonts.jost(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      "it up!",
                      style: GoogleFonts.jost(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Crafted with ♥️ in Bengaluru, India      ",
                      style: GoogleFonts.jost(
                        fontSize: 20,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
          Positioned(
           left: 0,
           right: 0,
           bottom: 0,
           child: Container(
               height: MediaQuery.of(context).size.height*0.1,
               color: Colors.white,
             child: Row(
                 children: [
                   SizedBox(width: 10,),
                 ClipRRect(
                   borderRadius:
                   BorderRadius.circular(40.0),
                   child: Image(image: AssetImage("images/final.png"),
                     fit: BoxFit.fitHeight,
                     ),
                 ),
                   SizedBox(width: 10,),
                   Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Order Now" , style: GoogleFonts.openSans(fontSize: 15 , fontWeight: FontWeight.w700),),
                       Text("View Full Menu" , style: GoogleFonts.openSans(fontSize: 12 , fontWeight: FontWeight.w400 , color:Colors.grey[800]),)
                       ],
                   ),
                   SizedBox(width: 50,),
                   ElevatedButton(onPressed: () {},
                       style: ElevatedButton.styleFrom(
                       primary: Colors.green[500],
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20),
                         ),
                         elevation: 4,
                     ),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("A items  |  ₹xyz" , style: GoogleFonts.openSans(fontSize: 12 , fontWeight: FontWeight.w700 , color:Colors.white),),
                         Text("Checkout" , style: GoogleFonts.openSans(fontSize: 17  , fontWeight: FontWeight.w900 , color:Colors.white),)
                       ],
                   ),
                     ), )
               ]
               ),
           )
         ),
         ]

      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.black),
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );

              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuScreen()),
              );
              break;
            case 2:
              // navigate to the Instamart screen
              // Example: Navigator.pushNamed(context, '/instamart');
              break;
            case 3:
              // navigate to the Dineout screen
              // Example: Navigator.pushNamed(context, '/dineout');
              break;
            case 4:
              // navigate to the Guide screen
              // Example: Navigator.pushNamed(context, '/guide');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 0 ? Icons.home : Icons.home_outlined,
              size: 30,
              color: currentIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 1 ? Icons.fastfood : Icons.fastfood_outlined,
              size: 30,
              color: currentIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 2
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
              size: 30,
              color: currentIndex == 2 ? Colors.black : Colors.grey,
            ),
            label: 'Instamart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 3
                  ? Icons.dinner_dining
                  : Icons.dinner_dining_outlined,
              size: 30,
              color: currentIndex == 3 ? Colors.black : Colors.grey,
            ),
            label: 'Dineout',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 4 ? Icons.book : Icons.book_outlined,
              size: 30,
              color: currentIndex == 4 ? Colors.black : Colors.grey,
            ),
            label: 'Guide',
          ),
        ],
      ),
    );
  }
}
