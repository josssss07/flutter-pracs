class BMICalculator {
  int weight = 0;
  int height = 0;
//BMI is weight in kilograms divided by height in meters squared.

  double calculate(int weight, int height) {
    return (weight / height) * (weight / height);
  }
}
