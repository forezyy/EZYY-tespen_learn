import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.orangeAccent,
                width: double.infinity,
                child: Center(child: SvgPicture.asset('assets/svgs/logo.svg')),
              ),
            ),
            _avatar(context),
            const SizedBox(
              height: 24,
            ),
            Text('2023')
          ],
        ),
      ),
    );
  }

  Widget _avatar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Button di tekan bang!")));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        clipBehavior: Clip.hardEdge,
        child: const Image(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1661956602139-ec64991b8b16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=965&q=80"),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
