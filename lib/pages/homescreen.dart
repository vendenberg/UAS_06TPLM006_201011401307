import 'package:uas_06tplm006_201011401307/pages/DateWidget.dart';
import 'package:flutter/material.dart';
import '../provider/cuaca_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CuacaProvider cuacaProvider = CuacaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/snowmountain.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CuacaProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(provider.cuacaModel.name ?? " ",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      TextFormField(
                        controller: provider.cityNameText,
                        decoration: const InputDecoration(
                          hintText: "Please Enter a City Name",
                          labelText: "City",
                        ),
                        onEditingComplete: () {
                          provider.showWeatherData();
                        },
                      ),
                      DateWidget(),
                      Text(provider.cuacaModel.weather?.first.main ?? ""),
                      Text(
                        '${provider.cuacaModel.main?.temp?.toStringAsFixed(0) ?? ""}\u00B0 Celcius',
                        style: TextStyle(fontSize: 55),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
