#include "calculator.h"

int
Calculator::factorial(int number)
{
  return number > 1 ? factorial(number - 1) : 1;
}
