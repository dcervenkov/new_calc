#include "calculator.h"

int
Calculator::factorial(int number)
{
  return number > 1 ? number * factorial(number - 1) : 1;
}
