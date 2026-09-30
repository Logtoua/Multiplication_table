#include <iostream>
#include <iomanip>
#include <limits>

void printTable(long long limit) {
  for (long long row = 1; row <= limit; ++row) {
    for (long long column = 1; column <= limit; ++column) {
      std::cout << std::setw(4) << row * column;
    }
    std::cout << '\n';
  }
}

int main() {
  long long number;

  while (true) {
    std::cout << "Enter a number from 1 to 12 (0 to exit): ";

    if (!(std::cin >> number)) {
      if (std::cin.eof()) {
        break;
      }

      std::cout << "Please enter a whole number.\n";
      std::cin.clear();
      std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
      continue;
    }

    if (number == 0) {
      std::cout << "Goodbye!\n";
      break;
    }

    if (number < 1 || number > 12) {
      std::cout << "Number must be between 1 and 12.\n";
      continue;
    }

    printTable(number);
  }

  return 0;
}
