
import 'dart:async';
import 'dart:math';

// Stock model
class Stock {
  final String symbol;
  final double price;
  final double dailyChange;

  Stock({
    required this.symbol,
    required this.price,
    required this.dailyChange,
  });

  // Creates a new Stock object with updated values
  Stock copyWith({
    String? symbol,
    double? price,
    double? dailyChange,
  }) {
    return Stock(
      symbol: symbol ?? this.symbol,
      price: price ?? this.price,
      dailyChange: dailyChange ?? this.dailyChange,
    );
  }
}

// Stock actions
enum StockAction {
  Increase,
  Decrease,
  Reset,
}

// Stock BLoC
class StockBloc {
  final _inputController = StreamController<StockAction>();

  final _outputController = StreamController<Stock>.broadcast();

  final Random _random = Random();

  final double _startingPrice = 150.00;

  Stock _currentStock = Stock(
    symbol: 'AAPL',
    price: 150.00,
    dailyChange: 0.00,
  );

  // Expose the output stream
  Stream<Stock> get stockStream => _outputController.stream;

  // Expose the input sink
  Sink<StockAction> get stockSink => _inputController.sink;

  // Listen for stock actions
  StockBloc() {
    _inputController.stream.listen((action) {
      double fluctuation =
          (_random.nextDouble() * 4) - 2;

      switch (action) {
        case StockAction.Increase:
          fluctuation = fluctuation.abs();
          break;

        case StockAction.Decrease:
          fluctuation = -fluctuation.abs();
          break;

        case StockAction.Reset:
          _currentStock = _currentStock.copyWith(
            price: _startingPrice,
            dailyChange: 0.0,
          );
          _outputController.sink.add(_currentStock);
          return;
      }

      _currentStock = _currentStock.copyWith(
        price: _currentStock.price + fluctuation,
        dailyChange: fluctuation,
      );

      _outputController.sink.add(_currentStock);
    });
  }

  // Close controllers when finished
  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
