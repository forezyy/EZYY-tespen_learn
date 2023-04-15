import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash screen'),
      ),
      body: Column(
        children: [...texts(), ...images(), ...buttons(context)],
      ),
    );
  }

  texts() {
    return [
      const Text(
        'Judul',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.1,
            fontStyle: FontStyle.italic),
      ),
      Text(
        'With google font',
        style: GoogleFonts.amiko(
            textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
        )),
      ),
      RichText(
          text: TextSpan(children: [
        TextSpan(
          text: 'Text with multiple style ',
          style: GoogleFonts.amiko(
              textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black)),
        ),
        TextSpan(
          text: 'Bold style ',
          style: GoogleFonts.amiko(
              textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        TextSpan(
          text: 'Italic style ',
          style: GoogleFonts.amiko(
              textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: Colors.black)),
        ),
      ]))
    ];
  }

  images() {
    return [
      const Image(
        image: NetworkImage(
            "https://images.unsplash.com/photo-1661956602139-ec64991b8b16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=965&q=80"),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      const Image(
        image: AssetImage("assets/images/bg.jpg"),
      ),
      SvgPicture.asset("assets/svgs/logo.svg")
    ];
  }

  buttons(BuildContext context) {
    return [
      ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Button di tekan bang!")));
        },
        child: Text('Tombol'),
        style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: Colors.black),
      )
    ];
  }
}
