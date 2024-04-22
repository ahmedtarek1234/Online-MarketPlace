abstract class Failurs{
  String message;
  Failurs(this.message);
  @override
  String toString() {
    return message;
  }
}

class RemoteFailurs extends Failurs{
  RemoteFailurs(super.message);
}
class localFailurs extends Failurs{
  localFailurs(super.message);
}