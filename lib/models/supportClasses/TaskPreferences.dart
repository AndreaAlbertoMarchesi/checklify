import '../Task.dart';

class TaskPreferences {
  TaskPreferences(this.percentageDivisions,this.colorValue, this.progressType);

  int colorValue;
  ProgressType progressType;
  int percentageDivisions;
}