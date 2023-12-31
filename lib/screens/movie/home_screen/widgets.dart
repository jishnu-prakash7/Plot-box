import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plotbox/model/movie.dart';
import 'package:plotbox/screens/movie/movie_details_screen/screen.dart';
import 'package:plotbox/widgets/home_and_details_ref.dart';

//movie Section

Widget movieSection(BuildContext context, movies movieone, int index) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetailsScreen(
              movie: movieone,
              movieindex: index,
            );
          }));
        },
        child: SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(movieone.imageUrl),
                fit: BoxFit.cover,
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailsScreen(
                movieindex: index,
                movie: movieone,
              );
            }));
          },
          child: Row(
            children: [
              detailsScectionText(
                  '${movieone.title} (${DateFormat('yyyy').format(movieone.releaseyear)})',
                  17,
                  Colors.white)
            ],
          ),
        ),
      ),
      RatingAndGenereSection(
          movieone.movierating.toString(), Icons.star, Colors.amber)
    ],
  );
}
