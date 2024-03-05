import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/models/materi.dart';
import 'package:projectapp/models/unit.dart';
import 'package:projectapp/widget/levelbutton_widget.dart';

class UnitWidget extends StatelessWidget {
  const UnitWidget({
    super.key,
    required this.unit,
    required this.materi,
  });

  final Unit unit;
  final Materi materi;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0), // Margin 20 px ke atas dan ke bawah
          child: Container(
            padding: const EdgeInsets.only(left: 10.0, top: 30),
            height: 170,
            color: Color.fromRGBO(0, 0, 0, 0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unit.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  unit.explanation,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        ...unit.levels.map((level) {
          return LevelButtonWidget(
            level: level,
            materi: materi,
          );
        })
      ],
    );
  }
}
