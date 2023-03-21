import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: cardsList.map(
                  (deal) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Center(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              tileColor: Colors.blueGrey[100],
                              leading: Text(
                                deal.id.toString(),
                              ),
                              title: Text(deal.title!),
                              subtitle: Text(deal.description!),
                              trailing: const Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ));
                  },
                ).toList(),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: cardsList.map(
                (deal) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            tileColor: Colors.blueGrey[100],
                            leading: Text(
                              deal.id.toString(),
                            ),
                            title: Text(deal.title!),
                            subtitle: Text(deal.description!),
                            trailing: const Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ));
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class CardItem {
  int? id;
  String? title;
  String? description;
  CardItem({this.id, this.title, this.description});
}

List<CardItem> cardsList = [
  CardItem(
    id: 1,
    title: 'Карточка №1',
    description: 'Обычная карточка',
  ),
  CardItem(
    id: 2,
    title: 'Карточка №2',
    description: 'Обычная карточка',
  ),
  CardItem(
    id: 3,
    title: 'Карточка №3',
    description: 'Редкая карточка',
  ),
  CardItem(
    id: 4,
    title: 'Карточка №4',
    description: 'Обычная карточка',
  ),
  CardItem(
    id: 5,
    title: 'Карточка №5',
    description: 'Обычная карточка',
  ),
  CardItem(
    id: 6,
    title: 'Карточка №6',
    description: 'Ультра редкая карточка',
  ),
  CardItem(
    id: 7,
    title: 'Карточка №7',
    description: 'Обычная карточка',
  ),
  CardItem(
    id: 8,
    title: 'Карточка №8',
    description: 'Обычная карточка',
  ),
  CardItem(
    id: 9,
    title: 'Карточка №9',
    description: 'Супер редкая карточка',
  ),
];
