import '../Task.dart';

class TaskPreferences {
  TaskPreferences(this.percentageDivisions,this.colorValue, this.progressType, this.doesShowDailyPercentage);

  int colorValue;
  ProgressType progressType;
  int percentageDivisions;
  bool doesShowDailyPercentage;
}