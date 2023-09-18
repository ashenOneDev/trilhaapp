import 'package:flutter/material.dart';
import 'package:trilhaap/model/card_detail.dart';
import 'package:trilhaap/pages/card_detail_page.dart';
import 'package:trilhaap/repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  CardDetailRepositoy cardDetailRepositoy = CardDetailRepositoy();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepositoy.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: cardDetail == null
              ? const LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardDetailPage(
                                  cardDetail: cardDetail!,
                                )));
                  },
                  child: Hero(
                    tag: cardDetail!.id,
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Image.network(
                                cardDetail!.url,
                                height: 20,
                              ),
                              Text(
                                cardDetail!.title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cardDetail!.text,
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.justify,
                            ),
                            Container(
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Ler mais",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    )))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
