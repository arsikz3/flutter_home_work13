import 'package:flutter_home_work13_provider/models/speaker.dart';
import 'package:flutter_home_work13_provider/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen extends StatelessWidget {
  final Speaker speaker;
  final Function(int) ratingChanged;

  const DetailsScreen({
    required this.speaker,
    required this.ratingChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speaker Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Image.asset(speaker.assetName,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                ),
                child: Center(
                    child: Text(speaker.name,
                        style: const TextStyle(
                          fontSize: 30.0,
                        )))),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                    child: Text(speaker.topic,
                        style: const TextStyle(
                          fontSize: 20.0,
                        )))),
            RatingBar.builder(
                initialRating: speaker.rating?.toDouble() ?? 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) =>
                    Utils.getRatingIcon(index + 1) ?? const SizedBox.shrink(),
                onRatingUpdate: (rating) => ratingChanged(rating.toInt())),
          ],
        ),
      ),
    );
  }
}
