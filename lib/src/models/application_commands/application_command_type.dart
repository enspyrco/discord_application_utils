// Application Command Types
enum ApplicationCommandType {
  // Slash commands; a text-based command that shows up when a user types /
  chatInput(1, 'CHAT_INPUT'),
  // A UI-based command that shows up when you right click or tap on a user
  user(2, 'USER'),
  // A UI-based command that shows up when you right click or tap on a message
  message(3, 'MESSAGE');

  const ApplicationCommandType(this.value, this.name);

  final int value;
  final String name;

  factory ApplicationCommandType.fromInt(int i) {
    return switch (i) {
      1 => ApplicationCommandType.chatInput,
      2 => ApplicationCommandType.user,
      3 => ApplicationCommandType.message,
      _ => throw '$i does not correspond to a valid ChannelType.'
    };
  }
}
