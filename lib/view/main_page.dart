import 'package:flutter/material.dart';
import 'package:fluttersinav/model/character.dart';
import 'package:fluttersinav/view/detay_page.dart';
import 'package:fluttersinav/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Karakterler",
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ),
        body: _buildCharacterList(context));
  }
}

Widget _buildCharacterList(BuildContext context) {
  return Consumer<MainViewModel>(
    builder: (context, viewModel, child) => ListView.builder(
      itemCount: viewModel.characters.length,
      itemBuilder: (context, index) {
        Character character = viewModel.characters[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetayPage(character)));
            },
            child: Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  border: Border.all(
                      color: Color.fromARGB(255, 255, 180, 68), width: 2),
                  color: Color.fromARGB(255, 244, 184, 131),
                ),
                child: Row(
                  children: [
                    Image.network(character.image),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            character.name,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            character.status,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            character.gender,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13),
                          ),
                          Text(
                            character.species,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 13, 175, 5),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    ),
  );
}
