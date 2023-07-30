// Interaction Types
// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-object-interaction-type
enum InteractionType {
  ping(1, 'PING'),
  applicationCommand(2, 'APPLICATION_COMMAND'),
  messageComponent(3, 'MESSAGE_COMPONENT'),
  applicationCommandAutocomplete(4, 'APPLICATION_COMMAND_AUTOCOMPLETE'),
  modalSubmit(5, 'MODAL_SUBMIT');

  const InteractionType(this.value, this.name);

  final int value;
  final String name;

  factory InteractionType.fromInt(int i) {
    return switch (i) {
      1 => InteractionType.ping,
      2 => InteractionType.applicationCommand,
      3 => InteractionType.messageComponent,
      4 => InteractionType.applicationCommandAutocomplete,
      5 => InteractionType.modalSubmit,
      _ => throw '$i does not correspond to a valid InteractionType.'
    };
  }
}
