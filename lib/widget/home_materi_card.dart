import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projectapp/models/materi.dart';
import 'package:projectapp/widget/map/map_materi.dart';


class HomeMateriCard extends StatelessWidget {
  const HomeMateriCard({
    super.key,
    required this.materi,
  });

  final Materi materi;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MapMateri(materi: materi);
        }));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.white,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      r'http://10.0.2.2:8000/storage/' + materi.imageCard.replaceFirst('public/', ''),
                      height: 150,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  ListTile(
                    title: Text(
                        materi.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
