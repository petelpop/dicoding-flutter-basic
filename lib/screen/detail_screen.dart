import 'package:flutter/material.dart';
import 'package:wisatabandung/model/tourism_place.dart';


class DetailScreen extends StatelessWidget {
  final TourismPlace place;

    const DetailScreen({Key? key, required this.place}) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Scaffold(
          body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Image(context),
                  _placeName(),
                  _status(),
                  _description(),
                  _imageUrl(),
                          ],
                        ),
                    ),
              );
    }

    SizedBox _imageUrl() {
      return SizedBox(
                          height: 150,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children:
                                    place.imageUrls.map((url){
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(url),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                );
    }

    Container _description() {
      return Container(
                        padding:const EdgeInsets.all(16.0),
                        child: Text(
                        place.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Staatliches'
                          )
                          ),
                        );
    }

    Container _status() {
      return Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.calendar_today),
                            const SizedBox(height: 8.0),
                            Text(
                              place.openDays,
                              style: const TextStyle(fontFamily: 'Oxygen'),
                              ),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.watch_later_outlined),
                            const SizedBox(height: 8.0),
                            Text(
                              place.openTime,
                              style: const TextStyle(fontFamily: 'Oxygen'),
                              )
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.monetization_on),
                            const SizedBox(height: 8.0),
                            Text(
                              place.ticketPrice,
                              style: const TextStyle(fontFamily: 'Oxygen'),
                              )
                          ],
                        ),
                      ],
                    ),
                  );
    }

    Container _placeName() {
      return Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    place.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                  );
    }

    Stack _Image(BuildContext context) {
      return Stack(
                  children: [
                  Image.asset(place.imageAsset),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  ), 
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const FavouriteButton()
                  ],
                  );
    }
}

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 100, 100);
  }
 
  bool shouldReclip(oldClipper) {
    return false;
  }
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({Key? key}) : super(key: key);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context){
    return IconButton(
      icon: Icon(
        isFavourite? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
        ),
      onPressed: () {
        setState(() {
          isFavourite = !isFavourite;
        });
      });
  }
}