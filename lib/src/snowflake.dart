// https://discord.com/developers/docs/reference#snowflakes
final class Snowflake {
  Snowflake._(this.stringValue);

  final String stringValue;

  factory Snowflake.fromJson(String jsonString) => Snowflake._(jsonString);
}
