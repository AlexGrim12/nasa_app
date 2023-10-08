import 'package:nasa_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/screens/chatbot_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Componentes en Flutter'),
          automaticallyImplyLeading: false,
        ),
        body:
            // Column(
            //   children: [
            ListView.separated(
          itemBuilder: (context, i) => ListTile(
            leading: Icon(
              menuOptions[i].icon,
            ),
            title: Text(menuOptions[i].name),
            onTap: () {
              // final route = MaterialPageRoute(
              //     builder: (context) => const Listview1Screen());
              // Navigator.push(context, route);
              Navigator.pushNamed(context, menuOptions[i].route);
            },
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: menuOptions.length,
        )
        // ,
        // ElevatedButton(
        //   onPressed: () {
        //     showDialog(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return Dialog(
        //           child: ChatbotScreen(),
        //         );
        //       },
        //     );
        //   },
        //   child: const Text('Open Chatbot'),
        // )
        //   ],
        // ),
        );
  }
}
