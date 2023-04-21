import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const ImageCarousel({Key? key, required this.imageUrls}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.9,
            viewportFraction: 0.8,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: false,
            enableInfiniteScroll: true,
            autoPlay: true,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          items: widget.imageUrls.map((imageUrl) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.imageUrls.length; i++)
              Text(
                '${i + 1}/${widget.imageUrls.length}  ',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: i == _currentPage ? Colors.black : Colors.grey,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
