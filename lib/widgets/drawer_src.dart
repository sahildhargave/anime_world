import 'about_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'sahildhargave5253@gmail.com',
  );

  Future<void> _launchUrlMessage() async {
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch $emailLaunchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView(children: [
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 200,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/icons/icon10242.jpeg'),
                    radius: 80,
                  ),
                  Text('Anime-WallPaper App',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            const Divider(),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color(0xFF273141),
                  leading: const Icon(Icons.info),
                  title: const Text('About Us'),
                ),
              ),
              onTap: () {
                //about dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return AboutDialogue(
                      title: 'AnimeWall',
                      content: 'Made with ❤️👨‍💻 by Sahil, Inc',
                      info: '© 2023 Anime, All rights reserved',
                      onClose: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              },
            ),

            //message us
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color(0xFF273141),
                  leading:
                      Icon(Icons.message_outlined, color: Colors.blue.shade300),
                  title: const Text('How can we improve?'),
                  subtitle: const Text(
                    'Tell us how we can improve this app?',
                    style: TextStyle(color: Colors.white24),
                  ),
                ),
              ),
              onTap: () {
                _launchUrlMessage();
              },
            ),

            //rate us
            GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    tileColor: const Color(0xFF273141),
                    leading: const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    title: const Text('Rate app'),
                  ),
                ),
                onTap: () {}),

            //Share our app.
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color(0xFF273141),
                  leading: const Icon(Icons.share),
                  title: const Text('Share app'),
                  subtitle: const Text(
                    'Share with your friends',
                    style: TextStyle(color: Colors.white24),
                  ),
                ),
              ),
            ),
            //age rating
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: const Color(0xFF273141),
                leading: const Icon(Icons.child_care),
                title: const Text('Age Rating'),
                //trailing:       ,
              ),
            ),

            //Themes
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: const Color(0xFF273141),
                leading: const Icon(Icons.light),
                title: const Text('Theme'),
                //trailing:       ,
              ),
            ),
            const Divider(),
          ]),
        ),
      ),
    );
  }
}
