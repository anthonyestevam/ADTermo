class Medication {
  final String id;
  final String name;
  final String idealTemperature;
  final String alertTitle;
  final String description;
  final List<String> steps;
  final List<String> stepIcons;

  const Medication({
    required this.id,
    required this.name,
    required this.idealTemperature,
    required this.alertTitle,
    required this.description,
    required this.steps,
    required this.stepIcons,
  });
}