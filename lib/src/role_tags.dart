import 'package:json_utils/json_utils.dart';

import 'snowflake.dart';

// https://discord.com/developers/docs/topics/permissions#role-object-role-tags-structure
// Tags with type null represent booleans.
// They will be present and set to null if they are "true", and will be not present if they are "false".
final class RoleTags {
  RoleTags._(
    this.botId,
    this.integrationId,
    this.premiumSubscriber,
    this.subscriptionListingId,
    this.availableForPurchase,
    this.guildConnections,
  );

  // the id of the bot this role belongs to
  final Snowflake? botId;

  // the id of the integration this role belongs to
  final Snowflake? integrationId;

  // whether this is the guild's Booster role
  // null
  final bool premiumSubscriber;

  // the id of this role's subscription sku and listing
  final Snowflake? subscriptionListingId;

  // whether this role is available for purchase
  // null
  final bool availableForPurchase;

  // whether this role is a guild's linked role
  // null
  final bool guildConnections;

  factory RoleTags.fromJson(JsonMap json) {
    if (json
        case {
          'bot_id': String? botIdString,
          'integration_id': String? integrationIdString,
          'premium_subscriber': Object? premiumSubscriberNullType,
          'subscription_listing_id': String? subscriptionListingIdString,
          'available_for_purchase': Object? availableForPurchaseNullType,
          'guild_connections': Object? guildConnectionsNullType,
        }) {
      return RoleTags._(
        botIdString == null ? null : Snowflake.fromJson(botIdString),
        integrationIdString == null
            ? null
            : Snowflake.fromJson(integrationIdString),
        premiumSubscriberNullType == null ? false : true,
        subscriptionListingIdString == null
            ? null
            : Snowflake.fromJson(subscriptionListingIdString),
        availableForPurchaseNullType == null ? false : true,
        guildConnectionsNullType == null ? false : true,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'bot_id': String?,
          'integration_id': String?,
          'premium_subscriber': null?,
          'subscription_listing_id': String?,
          'available_for_purchase': null?,
          'guild_connections': null?,
        }
      ''', json);
    }
  }
}
