import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:practica_integradora_1/providers/main_provider.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    context.read<MainProvider>().updateQuote();
    context.read<MainProvider>().updateTime("Mexico");
  }

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text("La frase diaria"),
      ),
      stickyFrontLayer: true,
      backLayer: BackdropNavigationBackLayer(
        items: [
          ListTile(
            leading: Image.network("https://flagcdn.com/32x24/ad.png"),
            title: Text(
              "Andorra",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              context.read<MainProvider>().updateQuote();
              context.read<MainProvider>().updateTime("Andorra");
              context.read<MainProvider>().updateImage();
            },
          ),
          ListTile(
            leading: Image.network("https://flagcdn.com/32x24/mx.png"),
            title: Text(
              "Mexico",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              context.read<MainProvider>().updateQuote();
              context.read<MainProvider>().updateTime("Mexico");
              context.read<MainProvider>().updateImage();
            },
          ),
          ListTile(
            leading: Image.network("https://flagcdn.com/32x24/pe.png"),
            title: Text(
              "Peru",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              context.read<MainProvider>().updateQuote();
              context.read<MainProvider>().updateTime("Peru");
              context.read<MainProvider>().updateImage();
            },
          ),
          ListTile(
            leading: Image.network("https://flagcdn.com/32x24/ca.png"),
            title: Text(
              "Canada",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              context.read<MainProvider>().updateQuote();
              context.read<MainProvider>().updateTime("Canada");
              context.read<MainProvider>().updateImage();
            },
          ),
          ListTile(
            leading: Image.network("https://flagcdn.com/32x24/ar.png"),
            title: Text(
              "Argentina",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              context.read<MainProvider>().updateQuote();
              context.read<MainProvider>().updateTime("Argentina");
              context.read<MainProvider>().updateImage();
            },
          ),
        ],
      ),
      frontLayer: Consumer<MainProvider>(
        builder: (context, mainProvider, child) => Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(mainProvider.imageUrl),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.darken),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                mainProvider.country,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Text(
                mainProvider.time,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      mainProvider.quote,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Text(
                    "-${mainProvider.author}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
