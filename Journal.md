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
