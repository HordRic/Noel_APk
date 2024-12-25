import 'dart:math';

import 'package:flutter/material.dart';
import 'package:joyeux_noel/home_screen.dart';

class QuoteScreen extends StatefulWidget {
  final String name;
  const QuoteScreen({super.key, required this.name});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  String quote = "";

  final List<String> allQuotes = [
    "May peace and harmony reign in your homes this Christmas season.",
    "May you find happiness and joy in every moment shared with your loved ones.",
    "May health and well-being accompany you throughout the coming year.",
    "May love and friendship light up your days and warm your nights.",
    "May your career be filled with great success and bring you satisfaction and fulfillment.",
    "May every family gathering be an opportunity to create unforgettable memories.",
    "May you receive gifts that fill your heart with joy and gratitude.",
    "May serenity and calm fill your mind and bring you a sense of inner peace.",
    "May smiles and laughter brighten your days and soften your nights.",
    "May the warmth and comfort of your home be a source of happiness and solace.",
    "May your academic journey be crowned with success and achievements.",
    "May financial prosperity accompany you and open new opportunities.",
    "May every adventure you undertake be filled with passion and excitement.",
    "May you find moments of relaxation to recharge and rejuvenate.",
    "May hope and inspiration guide your steps and light your path.",
    "May you experience the joy of giving and sharing with those in need.",
    "May you create lasting traditions that bring joy year after year.",
    "May your heart be filled with the magic of the holiday season.",
    "May your home be filled with love, laughter, and festive cheer.",
    "May you find time to reflect on the blessings in your life.",
    "May your dreams come true and your goals be achieved.",
    "May you be surrounded by the warmth of friends and family.",
    "May the spirit of Christmas bring you peace and contentment.",
    "May you find joy in the simple pleasures of life.",
    "May your heart be light and your days be bright.",
    "May you create wonderful memories that last a lifetime.",
    "May you be blessed with good health and long life.",
    "May you find the courage to follow your dreams.",
    "May your home be a sanctuary of love and peace.",
    "May you experience the true meaning of Christmas.",
    "May your heart be open to love and kindness.",
    "May you find joy in the beauty of the season.",
    "May your days be filled with joy and happiness.",
    "May you be blessed with abundance and prosperity.",
    "May your heart be filled with gratitude and appreciation.",
    "May you find comfort in the company of loved ones.",
    "May your spirit be lifted by the magic of Christmas.",
    "May you find peace in the quiet moments of the season.",
    "May you be surrounded by the love and warmth of family.",
    "May your Christmas be filled with joy and laughter.",
    "May you find happiness in the little things.",
    "May you be blessed with good fortune and success.",
    "May your days be merry and bright.",
    "May you find joy in the giving and receiving of gifts.",
    "May you experience the wonder and awe of Christmas.",
    "May your heart be filled with the spirit of the season.",
    "May you find peace and tranquility in your life.",
    "May you be surrounded by the beauty of nature.",
    "May your Christmas be filled with love and joy.",
    "May you find strength and courage in difficult times.",
    "May you be blessed with hope and inspiration.",
    "May your days be filled with love and laughter.",
    "May you find joy in the presence of loved ones.",
    "May you be blessed with kindness and generosity.",
    "May your heart be filled with compassion and understanding.",
    "May you find peace and happiness in your journey.",
    "May you be surrounded by the light of the season.",
    "May your Christmas be filled with wonder and magic.",
    "May you find joy in the beauty of the holidays.",
    "May your heart be light and your spirit bright.",
    "May you be blessed with love and happiness.",
    "May your days be filled with peace and serenity.",
    "May you find joy in the traditions of the season.",
    "May you be surrounded by the warmth of love.",
    "May your heart be filled with the joy of giving.",
    "May you find happiness in the company of friends.",
    "May you be blessed with the spirit of Christmas.",
    "May your days be bright and your heart be light.",
    "May you find joy in the festive celebrations.",
    "May you be surrounded by love and good cheer.",
    "May your Christmas be filled with peace and joy.",
    "May you find happiness in the magic of the season.",
    "May your heart be filled with the joy of Christmas.",
    "May you be blessed with hope and happiness.",
    "May your days be filled with love and light.",
    "May you find joy in the spirit of the season.",
    "May you be surrounded by the warmth of the holidays.",
    "May your heart be filled with the peace of Christmas.",
    "May you find happiness in the holiday traditions.",
    "May you be blessed with the joy of giving.",
    "May your days be merry and your heart be bright.",
    "May you find joy in the company of loved ones.",
    "May you be surrounded by the beauty of Christmas.",
    "May your heart be filled with the spirit of giving.",
    "May you find happiness in the simple joys of life.",
    "May you be blessed with the love of family and friends.",
    "May your days be filled with the magic of the season.",
    "May you find joy in the celebration of Christmas.",
    "May you be surrounded by the joy of the holidays.",
    "May your heart be filled with the wonder of Christmas.",
    "May you find happiness in the spirit of the holidays.",
    "May you be blessed with the peace of the season.",
    "May your days be merry and bright with Christmas cheer.",
    "May you find joy in the traditions of Christmas.",
    "May you be surrounded by the love and warmth of family."
  ];

  void generateRandoQuote() {
    quote = allQuotes[Random().nextInt(allQuotes.length)];
  }

  void _showQuoteDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                color: Color(0xffc63023),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Santa Quote",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      quote,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          },
                          child: Text(
                            "Close",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffc63023),
        title: Text("Hey,${widget.name}!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Merry Christmas",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              "Choose a Santa Box",
              style: TextStyle(fontSize: 19),
            ),
            SizedBox(height: 20),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Ink.image(
                    image: AssetImage("images/gift.png"),
                    fit: BoxFit.cover,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        generateRandoQuote();
                        _showQuoteDialog();
                        setState(() {});
                      },
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
