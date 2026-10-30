# Bugs

- Profiling errors
  - `profiling:/home/lunet/majd7/Documents:Cannot create directory`
  - `profiling:/home/lunet/majd7/Documents/Fuzztest/printer.gcda:Skip`
- Buffer overflow when input is too long
  - Error code 110
- Stack overflow if too many hashes in a row
  - Error code 106
- Stack overflow if too much nested formatting
  - Error code 106
- Cannot handle NULL byte in the middle of a string
- Nonexistent formatting options displays letters but not the hash
  - e.g. `#BLA` => `BLA`
