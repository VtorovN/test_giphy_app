/// Used for compile-time conditional statements
class StaticAssert {
  const StaticAssert(bool condition, String message) : assert(condition, message);
}
