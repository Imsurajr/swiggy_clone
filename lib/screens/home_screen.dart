import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swiggy_clone/modals/carousel_slider.dart';
import 'package:swiggy_clone/screens/clicked.dart';
import 'package:swiggy_clone/screens/location_screen.dart';
import 'package:chewie/chewie.dart';
import 'package:swiggy_clone/screens/menu_screen.dart';
import 'package:swiggy_clone/screens/profile_screen.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      autoPlay: true,
      looping: true,
      showControls: false,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _chewieController.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LocationScreen(),
              ),
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
      //todo
      body: Stack(
        children:
        [SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                              hintText:
                                  'Search for dishes, restaurants & groceries',
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200],
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.17,
                            child: Image(image: AssetImage("images/start1.jpg")),
                          ),
                          Text(
                            "Food",
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200],
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.16,
                            child: Image(
                              image: AssetImage("images/start2.jpg"),
                            ),
                          ),
                        ),
                        Text(
                          "Instamart",
                          style: GoogleFonts.openSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200],
                              ),
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.18,
                              child: Image(
                                image: AssetImage("images/start3.jpg"),
                              ),
                            ),
                          ),
                          Text(
                            "Dineout",
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200],
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.18,
                            child: ClipOval(
                              child: Image(
                                fit: BoxFit.fitHeight,
                                image: AssetImage("images/start4.jpg"),
                              ),
                            ),
                          ),
                          Text(
                            "Genie",
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Chewie(controller: _chewieController),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuScreen()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ImageCarousel(
                              imageUrls: [
                                "images/image11.jpg",
                                "images/image12.jpg",
                                "images/image13.jpg",
                                "images/image14.jpg",
                                "images/image15.jpg",
                                "images/image16.jpg",
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 1,
                            color: Colors.grey[800],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Text(
                            "DISCOVER SWIGGY",
                            style: GoogleFonts.openSans(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 1,
                            color: Colors.grey[800],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
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
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: Image(
                                      image: AssetImage('images/imagebox1.jpg'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 28.0),
                                    child: Text(
                                      "Feel the goodness of Ayurveda!",
                                      style: GoogleFonts.lato(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Celebrate life with Dabur products.",
                                    style: GoogleFonts.lato(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.75,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        primary:
                                            Colors.pink[900], // Background color
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Clicked()),
                                        );
                                        setState(() {
                                          currentIndex = 2;
                                        });
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 13.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Order Now",
                                              style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(Icons.shopping_cart_outlined)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (contex) => Clicked()),
                              );
                            },
                            child: Container(
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
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Image(
                                image: AssetImage("images/imagebox2.jpg"),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
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
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Image(
                                    image: AssetImage('images/imagebox3.jpg'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          0.45),
                                  child: Text(
                                    "Tried Instamart?",
                                    style: GoogleFonts.lato(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 28.0),
                                  child: Text(
                                    "You can get your monthly stockup in mins!",
                                    style: GoogleFonts.lato(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 38.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "With ",
                                        style: GoogleFonts.lato(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        "flat ₹100 OFF ",
                                        style: GoogleFonts.lato(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "& ",
                                        style: GoogleFonts.lato(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        "free delivery ",
                                        style: GoogleFonts.lato(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        primary:
                                            Colors.pink[600], // Background color
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Clicked()),
                                        );
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 13.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Order Now",
                                              style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(Icons.shopping_cart_outlined)
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
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
                    ],
                  ),
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
