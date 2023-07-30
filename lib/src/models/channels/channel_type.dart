// Channel Types
enum ChannelType {
  // a text channel within a server
  guildText(0, 'GUILD_TEXT'),

  // a direct message between users
  dm(1, 'DM'),

  // a voice channel within a server
  guildVoice(2, 'GUILD_VOICE'),

  // a direct message between multiple users
  groupDM(3, 'GROUP_DM'),

  // an organizational category that contains up to 50 channels
  guildCategory(4, 'GUILD_CATEGORY'),

  // a channel that users can follow and crosspost into their own server (formerly news channels)
  guildAnnouncement(5, 'GUILD_ANNOUNCEMENT'),

  // a temporary sub-channel within a GUILD_ANNOUNCEMENT channel
  announcementThread(10, 'ANNOUNCEMENT_THREAD'),

  // a temporary sub-channel within a GUILD_TEXT or GUILD_FORUM channel
  publicThread(11, 'PUBLIC_THREAD'),

  // a temporary sub-channel within a GUILD_TEXT channel that is only viewable by those invited and those with the MANAGE_THREADS permission
  privateThread(12, 'PRIVATE_THREAD'),

  // a voice channel for hosting events with an audience
  guildStageVoice(13, 'GUILD_STAGE_VOICE'),

  // the channel in a hub containing the listed servers
  guildDirectory(14, 'GUILD_DIRECTORY'),

  // Channel that can only contain threads
  guildForm(15, 'GUILD_FORUM');

  const ChannelType(this.value, this.name);

  final int value;
  final String name;

  factory ChannelType.fromInt(int i) {
    return switch (i) {
      0 => ChannelType.guildText,
      1 => ChannelType.dm,
      2 => ChannelType.guildVoice,
      3 => ChannelType.groupDM,
      4 => ChannelType.guildCategory,
      5 => ChannelType.guildAnnouncement,
      10 => ChannelType.announcementThread,
      11 => ChannelType.publicThread,
      12 => ChannelType.privateThread,
      13 => ChannelType.guildStageVoice,
      14 => ChannelType.guildDirectory,
      15 => ChannelType.guildForm,
      _ => throw '$i does not correspond to a valid ChannelType.'
    };
  }
}
