class Process
{
  final String name;
  final int pID;
  bool isActive;

  Process(this.name, this.pID, this.isActive);

  // TODO: Call Gizmo engine.
  static List<Process> fetchAll(){
    return [];
  }
}