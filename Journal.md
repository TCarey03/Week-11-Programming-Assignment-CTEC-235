Phase 1: The Market Model

Journal Prompt: What is the difference between mutating a field and using a copyWith method?

Mutating a field changes the existing object directly. Using copyWith creates a new object with the updated information while keeping the original object unchanged. This makes the program easier to manage and helps the StreamBuilder recognize updated stock data.

--------------------

Phase 2: The Ticker Tape

Journal Prompt: How does the StreamBuilder know when to rebuild the UI? Compare this reactive approach to the imperative approach of calling setState inside a StatefulWidget.

The StreamBuilder listens to the stock stream and automatically rebuilds when new data is received. This is different from setState because I don't have to manually tell Flutter to update the screen. The stream handles the updates automatically.

--------------------

Phase 3: The Trading Floor

Journal Prompt: Trace the path of a button press. Where exactly does the rebuild of the widget happen?

When I press a button, it sends a StockAction into the BLoC through the input Sink. The BLoC processes the action, uses copyWith to create a new Stock object, and sends it through the output stream. The StreamBuilder receives the updated information and rebuilds the UI automatically. The rebuild happens inside the StreamBuilder without using setState.

--------------------

Phase 4: Validation & Reflection

Journal Prompt: How does the BLoC pattern help separate Business Logic from UI? If you wanted to change the UI to look like a professional trading terminal, would you have to change any code inside your StockBloc? Why or why not?

The BLoC pattern separates the business logic from the user interface. The StockBloc handles stock prices, calculations, and updates, while the UI displays the information. If I wanted to change the app to look like a professional trading terminal, I would only need to change the UI code. I would not need to change the StockBloc because it handles the data separately from how the app looks.
