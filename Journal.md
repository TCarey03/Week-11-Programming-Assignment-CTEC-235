Phase 1: The Market Model

Journal Prompt: What is the difference between mutating a field and using a copyWith method?

Mutating a field changes the existing object directly. Using copyWith creates a new object with the updated information while keeping the original object unchanged. This makes the program easier to manage and helps the StreamBuilder recognize updated stock data.

--------------------

Phase 2: The Ticker Tape

Journal Prompt: How does the StreamBuilder know when to rebuild the UI? Compare this reactive approach to the imperative approach of calling setState inside a StatefulWidget.

The StreamBuilder listens to the stock stream and automatically rebuilds when new data is received. This is different from setState because I don't have to manually tell Flutter to update the screen. The stream handles the updates automatically.
