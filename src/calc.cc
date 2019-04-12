#include "calculator.h"

#include <iostream>

int main() {
    Calculator calc;
    int number;
    std::cout << "Input a number: ";
    std::cin >> number;
    std::cout << "The factorial of " << number << " is " << calc.factorial(number) << std::endl;
}
