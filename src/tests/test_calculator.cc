#define CATCH_CONFIG_MAIN
#include "catch.h"

#include "calculator.h"

TEST_CASE("various factorials", "[factorial]") {
	Calculator calc;

    REQUIRE(calc.factorial(0) == 1);
    REQUIRE(calc.factorial(1) == 1);
    REQUIRE(calc.factorial(2) == 2);
}
