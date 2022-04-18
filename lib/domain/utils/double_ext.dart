final List<String> _directions =['N','NE','E','SE','S','SW','W','NW'];

extension ParseDegToDirection on double{
  String getDirection(){
    var degrees = this * 8 / 360;
    degrees.toStringAsFixed(0);
    degrees = (degrees + 8) % 8;
    return(_directions[degrees.toInt()]);
  }
}