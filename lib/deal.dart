import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_deal.dart';

class DealPages extends StatefulWidget {
  String filterText;
  DealPages({super.key, required this.filterText});

  @override
  State<DealPages> createState() => _DealPagesState();
}

class _DealPagesState extends State<DealPages> {
  List<Deal> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("deals").snapshots(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else {
                var list = snapshot.data.docs;
                if (widget.filterText != null) {
                  list = snapshot.data.docs
                      .where((x) => x['name']
                              .toLowerCase()
                              .contains(widget.filterText.toLowerCase())
                          ? true
                          : false)
                      .toList();
                }

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      buildList(context, list[index]),
                );
              }
            }));
  }
}

Widget buildList(context, docs) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        docs['name'],
      ),
      subtitle: Text(docs['description']),
      leading: Image.network(
        docs['image'],
      ),
      onTap: () {
        var deal =
            Deal(docs.id, docs['name'], docs['description'], docs['image']);
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => AddDeal(deal)));
      },
    ),
  );
}

class Deal {
  String id;
  String name;
  String description;
  String image;
  Deal(this.id, this.name, this.description, this.image);
}

List<Deal> dealList = [
  Deal('1', '', 'Сходить в магазин', 'Купить молоко,хлеб,сыр'),
  Deal('2', '', 'Flutter', 'Прописать Flutter upgrade'),
  Deal('3', '', 'Поиграть Dota 2', 'Выиграть в турнире'),
  Deal('4', '', "Сходить за посылкой", "Сходить за посылкой на почту"),
];
