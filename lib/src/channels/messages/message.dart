import 'package:json_utils/json_utils.dart';

import '../../application/application.dart';
import '../../interactions/message_components.dart';
import '../../stickers/sticker.dart';
import '../../stickers/sticker_item.dart';
import '../attachment.dart';
import '../channel.dart';
import '../channel_mention.dart';
import '../embeds/embed.dart';
import '../reaction.dart';
import '../../snowflake.dart';
import '../../user.dart';
import '../role_subscription_data.dart';
import 'message_activity.dart';
import 'message_interaction.dart';
import 'message_reference.dart';

// https://discord.com/developers/docs/resources/channel#message-object
// Represents a message sent in a channel within Discord.

// https://discord.com/developers/docs/resources/channel#message-object-message-structure
final class Message {
  Message._(
    this.id,
    this.channelId,
    this.author,
    this.content,
    this.timestamp,
    this.editedTimestamp,
    this.tts,
    this.mentionEveryone,
    this.mentions,
    this.mentionRoles,
    this.mentionChannels,
    this.attachments,
    this.embeds,
    this.reactions,
    this.nonce,
    this.pinned,
    this.webhookId,
    this.type,
    this.activity,
    this.application,
    this.applicationId,
    this.messageReference,
    this.flags,
    this.referencedMessage,
    this.interaction,
    this.thread,
    this.components,
    this.stickerItems,
    this.stickers,
    this.position,
    this.roleSubscriptionData,
  );

  // id of the message
  final Snowflake id;

  // id of the channel the message was sent in
  final Snowflake channelId;

  // the author of this message (not guaranteed to be a valid user, see below)
  // The author object follows the structure of the user object, but is only a valid user in the case where the message is generated by a user or bot user. If the message is generated by a webhook, the author object corresponds to the webhook's id, username, and avatar. You can tell if a message is generated by a webhook by checking for the webhook_id on the message object.
  final User author;

  // contents of the message
  // An app will receive empty values in the content, embeds, attachments, and components fields if they have not configured (or been approved for) the MESSAGE_CONTENT privileged intent (1 << 15).
  final String content;

  // when this message was sent
  final DateTime timestamp;

  // when this message was edited (or null if never)
  final DateTime? editedTimestamp;

  // whether this was a TTS message
  final bool tts;

  // whether this message mentions everyone
  final bool mentionEveryone;

  // users specifically mentioned in the message
  final List<User> mentions;

  // roles specifically mentioned in this message
  // array of role object ids
  final List<Snowflake> mentionRoles;

  // channels specifically mentioned in this message
  // Not all channel mentions in a message will appear in mention_channels. Only textual channels that are visible to everyone in a lurkable guild will ever be included. Only crossposted messages (via Channel Following) currently include mention_channels at all. If no mentions in the message meet these requirements, this field will not be sent.
  final List<ChannelMention> mentionChannels;

  // any attached files
  // An app will receive empty values in the content, embeds, attachments, and components fields if they have not configured (or been approved for) the MESSAGE_CONTENT privileged intent (1 << 15).
  final List<Attachment> attachments;

  // any embedded content
  // An app will receive empty values in the content, embeds, attachments, and components fields if they have not configured (or been approved for) the MESSAGE_CONTENT privileged intent (1 << 15).
  final List<Embed> embeds;

  // reactions to the message
  final List<Reaction> reactions;

  // used for validating a message was sent
  // integer or string
  final Object? nonce;

  // 	whether this message is pinned
  final bool pinned;

  // if the message is generated by a webhook, this is the webhook's id
  final Snowflake? webhookId;

  // type of message
  final int type;

  // message activity object	sent with Rich Presence-related chat embeds
  final MessageActivity? activity;

  // sent with Rich Presence-related chat embeds
  // partial application object
  final Application? application;

  // if the message is an Interaction or application-owned webhook, this is the id of the application
  final Snowflake? applicationId;

  // data showing the source of a crosspost, channel follow add, pin, or reply message
  final MessageReference? messageReference;

  // message flags combined as a bitfield
  final int? flags;

  // message object	the message associated with the message_reference
  // This field is only returned for messages with a type of 19 (REPLY) or 21 (THREAD_STARTER_MESSAGE). If the message is a reply but the referenced_message field is not present, the backend did not attempt to fetch the message that was being replied to, so its state is unknown. If the field exists but is null, the referenced message was deleted.
  final Message? referencedMessage;

  // sent if the message is a response to an Interaction
  final MessageInteraction? interaction;

  // the thread that was started from this message, includes thread member object
  final Channel? thread;

  // sent if the message contains components like buttons, action rows, or other interactive components
  // An app will receive empty values in the content, embeds, attachments, and components fields if they have not configured (or been approved for) the MESSAGE_CONTENT privileged intent (1 << 15).
  final List<MessageComponent> components;

  // sent if the message contains stickers
  final List<StickerItem> stickerItems;

  // Deprecated the stickers sent with the message
  final List<Sticker> stickers;

  // A generally increasing integer (there may be gaps or duplicates) that represents the approximate position of the message in a thread, it can be used to estimate the relative position of the message in a thread in company with total_message_sent on parent thread
  final int? position;

  // data of the role subscription purchase or renewal that prompted this ROLE_SUBSCRIPTION_PURCHASE message
  final RoleSubscriptionData? roleSubscriptionData;

  factory Message.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'channel_id': String channelIdString,
          'author': JsonMap authorJsonMap,
          'content': String content,
          'timestamp': String timestampString,
          'edited_timestamp': String? editedTimestampString,
          'tts': bool tts,
          'mention_everyone': bool mentionEveryone,
          'mentions': JsonList mentionsJsonList,
          'mention_roles': JsonList mentionRolesJsonList,
          'mention_channels': JsonList mentionChannelsJsonList,
          'attachments': JsonList attachmentsJsonList,
          'embeds': JsonList embedsJsonList,
          'reactions': JsonList reactionsJsonList,
          'nonce': Object? nonce,
          'pinned': bool pinned,
          'webhook_id': String? webhookIdString,
          'type': int type,
          'activity': JsonMap? activityJsonMap,
          'application': JsonMap? applicationJsonMap,
          'application_id': String? applicationIdString,
          'message_reference': JsonMap? messageReferenceJsonMap,
          'flags': int? flags,
          'referenced_message': JsonMap? referencedMessageJsonMap,
          'interaction': JsonMap? interactionJsonMap,
          'thread': JsonMap? threadJsonMap,
          'components': JsonList componentsJsonList,
          'sticker_items': JsonList stickerItemsJsonList,
          'stickers': JsonList stickersJsonList,
          'position': int? position,
          'role_subscription_data': JsonMap? roleSubscriptionDataJsonMap,
        }) {
      return Message._(
        Snowflake.fromJson(idString),
        Snowflake.fromJson(channelIdString),
        User.fromJson(authorJsonMap),
        content,
        DateTime.parse(timestampString),
        editedTimestampString == null
            ? null
            : DateTime.parse(editedTimestampString),
        tts,
        mentionEveryone,
        List<User>.from(mentionsJsonList),
        List<Snowflake>.from(mentionRolesJsonList),
        List<ChannelMention>.from(mentionChannelsJsonList),
        List<Attachment>.from(attachmentsJsonList),
        List<Embed>.from(embedsJsonList),
        List<Reaction>.from(reactionsJsonList),
        nonce,
        pinned,
        webhookIdString == null ? null : Snowflake.fromJson(webhookIdString),
        type,
        activityJsonMap == null
            ? null
            : MessageActivity.fromJson(activityJsonMap),
        applicationJsonMap == null
            ? null
            : Application.fromJson(applicationJsonMap),
        applicationIdString == null
            ? null
            : Snowflake.fromJson(applicationIdString),
        messageReferenceJsonMap == null
            ? null
            : MessageReference.fromJson(messageReferenceJsonMap),
        flags,
        referencedMessageJsonMap == null
            ? null
            : Message.fromJson(referencedMessageJsonMap),
        interactionJsonMap == null
            ? null
            : MessageInteraction.fromJson(interactionJsonMap),
        threadJsonMap == null ? null : Channel.fromJson(threadJsonMap),
        List<MessageComponent>.from(componentsJsonList),
        List<StickerItem>.from(stickerItemsJsonList),
        List<Sticker>.from(stickersJsonList),
        position,
        roleSubscriptionDataJsonMap == null
            ? null
            : RoleSubscriptionData.fromJson(roleSubscriptionDataJsonMap),
      );
    } else {
      throw MalformedJsonMapException({
        'id': Snowflake,
        'channel_id': Snowflake,
        'author': User,
        'content': String,
        'timestamp': DateTime,
        'edited_timestamp': Nullable<DateTime>,
        'tts': bool,
        'mention_everyone': bool,
        'mentions': List<User>,
        'mention_roles': List<Snowflake>,
        'mention_channels': List<ChannelMention>,
        'attachments': List<Attachment>,
        'embeds': List<Embed>,
        'reactions': List<Reaction>,
        'nonce': Nullable<Object>,
        'pinned': bool,
        'webhook_id': Nullable<Snowflake>,
        'type': int,
        'activity': Nullable<MessageActivity>,
        'application': Nullable<Application>,
        'application_id': Nullable<Snowflake>,
        'message_reference': Nullable<MessageReference>,
        'flags': Nullable<int>,
        'referenced_message': Nullable<Message>,
        'interaction': Nullable<MessageInteraction>,
        'thread': Nullable<Channel>,
        'components': List<MessageComponent>,
        'sticker_items': List<StickerItem>,
        'stickers': List<Sticker>,
        'position': Nullable<int>,
        'role_subscription_data': Nullable<RoleSubscriptionData>,
      }, json);
    }
  }
}
