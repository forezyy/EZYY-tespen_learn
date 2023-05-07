import 'package:ezy_tespen_learn/repositories/card_repository.dart';
import 'package:ezy_tespen_learn/screens/login_screen_with_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';
import '../models/card_model.dart';

class HomeScreenWithApi extends StatelessWidget {
  HomeScreenWithApi({super.key});

  final cardRepository = CardRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
        future: cardRepository.getAllCards(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: snapshot.data!.map((e) => _card(e)).toList(),
            );
          }

          return Text('loading');
        },
      ),
    ));
  }

  Widget _card(CardModel card) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 12, left: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.amber,
      child: Column(
        children: [
          Text(card.name),
          Text(card.number),
        ],
      ),
    );
  }
}
