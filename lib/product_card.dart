import 'package:appdev_spring_25/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final Character char;
  const CharacterCard({super.key, required this.char});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 150,
                child: Image.network(
                  char.imageUrl,
                  width: double.infinity,
                )),
            Text(
              char.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    textWidthBasis: TextWidthBasis.parent,
                    overflow: TextOverflow.ellipsis,
                    char.affiliation.toString(),
                    softWrap: true,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Physical Description',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                char.physicalDescription.eyeColor,
                              ),
                              Text(char.physicalDescription.hairColor),
                              Text(char.physicalDescription.gender),
                              Text(
                                'Ages',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                char.bio.ages.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                'Alternative Names',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                char.bio.alternativeNames.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.remove_red_eye))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
