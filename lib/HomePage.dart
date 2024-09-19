import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'color.dart' as clr;
import 'fontSize.dart' as fnt;

class HomePage extends StatelessWidget {
  final VoidCallback onSwitchLanguage;

  const HomePage({super.key, required this.onSwitchLanguage});

  @override
  Widget build(BuildContext context) {
    final List<List> subjects = [
      ['tamil', AppLocalizations.of(context)!.tamil],
      ['english', AppLocalizations.of(context)!.english],
      ['maths', AppLocalizations.of(context)!.maths],
      ['science', AppLocalizations.of(context)!.science],
      ['socialScience', AppLocalizations.of(context)!.socialScience],
    ];

    return Scaffold(
        backgroundColor: clr.Colors.appBackgroundColor,
        body: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                /* Title bar */
                Row(children: [
                  Text(
                    AppLocalizations.of(context)!.greetings,
                    style: TextStyle(
                      color: clr.Colors.bodyColor,
                      fontSize: fnt.FonstSizes.appHeader,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: onSwitchLanguage,
                    style: TextButton.styleFrom(
                      backgroundColor: clr.Colors.buttonColor,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.languageSwitch,
                      style: TextStyle(color: clr.Colors.buttonContentColor),
                    ),
                  )
                ]),

                /* Games */
                Expanded(
                    child: ListView.builder(
                        itemCount: subjects.length,
                        itemBuilder: (_, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint(index.toString());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: clr.Colors.boxColor,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Container(
                                // color: clr.Colors.buttonContentColor,
                                padding: EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 250,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                subjects[index][1].trim(),
                                                style: TextStyle(
                                                  fontSize:
                                                      fnt.FonstSizes.title,
                                                  color: clr.Colors.titleColor,
                                                ),
                                                softWrap:
                                                    true, // Enables text wrapping
                                                overflow: TextOverflow
                                                    .ellipsis, // Adds "..." if the text overflows
                                                maxLines:
                                                    1, // Limits to 1 line, adjust if needed
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "2 " +
                                                    AppLocalizations.of(
                                                            context)!
                                                        .games +
                                                    "  |  8 " +
                                                    AppLocalizations.of(
                                                            context)!
                                                        .chapters,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color:
                                                      clr.Colors.boxBodyColor,
                                                ),
                                                softWrap:
                                                    true, // Enables text wrapping for this Text
                                                overflow: TextOverflow
                                                    .ellipsis, // Adds "..." if it overflows
                                                maxLines:
                                                    3, // Limit the number of lines
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assetsDir/Images/arrowheadYellow.png'))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
              ],
            )));
  }
}
