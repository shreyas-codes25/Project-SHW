import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:project_shw/pages/locations_for_google_maps.dart";
import "package:project_shw/pages/petrol_pumps.dart";


class AppDrawerForAll extends StatelessWidget {
  final String title;

  const AppDrawerForAll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      elevation: 0,
      flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.amber],
                  begin: Alignment.topLeft,
                  end: Alignment.topCenter))),
      title: Text(
        "Samruddhi Roadlines",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Times New Roman",
            fontStyle: FontStyle.italic,
            fontSize: 44 * MediaQuery.of(context).size.aspectRatio),
      ),

    );
  }

  void handleClick(String value, BuildContext context) {
    switch (value) {
      case 'Logout':
        logout();
        break;
      case 'See All Routes':
        locations(context);
        break;
      case 'view stops':
         stops(context);
        break;
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void locations(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationsForGoogleMaps(),
      ),
    );
  }
  void stops(BuildContext context) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PetrolPumps(),
      ),
    );
  }
}
// title != "Samruddhi Roadlines"
//     ? IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))
//     : IconButton(
//         icon: const Icon(
//           Icons.refresh,
//           size: 30,
//         ),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const Home(),
//             ),
//           );
//         },
//       ),