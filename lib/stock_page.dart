import 'package:flutter/material.dart';
import 'stock_bloc.dart';

class StockPage extends StatelessWidget {
  StockPage({super.key});

  final StockBloc stockBloc = StockBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Watcher'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: StreamBuilder<Stock>(
          stream: stockBloc.stockStream,
          initialData: Stock(
            symbol: 'AAPL',
            price: 150.00,
            dailyChange: 0.00,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            final stock = snapshot.data!;

            final priceColor = stock.dailyChange >= 0
                ? Colors.green
                : Colors.red;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stock.symbol,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  '\$${stock.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: priceColor,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'Daily Change: ${stock.dailyChange.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 35),

                // Bull Market button
                ElevatedButton(
                  onPressed: () {
                    stockBloc.stockSink.add(StockAction.Increase);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Bull Market'),
                ),

                // Bear Market button
                ElevatedButton(
                  onPressed: () {
                    stockBloc.stockSink.add(StockAction.Decrease);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Bear Market'),
                ),

                // Reset button
                ElevatedButton(
                  onPressed: () {
                    stockBloc.stockSink.add(StockAction.Reset);
                  },
                  child: const Text('Reset'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
