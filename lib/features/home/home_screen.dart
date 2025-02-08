import 'package:codekameleon/data/dart/tutorials.dart';
import 'package:codekameleon/features/home/tutorial_list.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading(title: "Quizes"),
              SizedBox(
                height: 180,
                child: CarouselView(
                  itemExtent: 300,
                  children: List.generate(
                    7,
                    (i) => ColoredBox(color: colorScheme.tertiaryContainer),
                  ),
                ),
              ),
              const Heading(title: "Currently Learning"),
              FutureBuilder(
                  future: ColorScheme.fromImageProvider(
                    provider: const AssetImage("assets/icons/javascript.png"),
                  ),
                  builder: (context, snapshot) {
                    return Container(
                      height: 200,
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: snapshot.data?.primaryContainer ??
                            colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [Image.asset("assets/icons/java.png")],
                      ),
                    );
                  }),
              const Heading(title: "Other Tutorials"),
            ],
          ),
        ),
      ),
    );
  }
}
