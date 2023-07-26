import 'package:json_utils/json_utils.dart';

import '../snowflake.dart';

// https://discord.com/developers/docs/resources/channel#role-subscription-data-object
final class RoleSubscriptionData {
  RoleSubscriptionData._(
    this.roleSubscriptionListingId,
    this.tierName,
    this.totalMonthsSubscribed,
    this.isRenewal,
  );

  // the id of the sku and listing that the user is subscribed to
  final Snowflake roleSubscriptionListingId;

  // the name of the tier that the user is subscribed to
  final String tierName;

  // the cumulative number of months that the user has been subscribed for
  final int totalMonthsSubscribed;

  // whether this notification is for a renewal rather than a new purchase
  final bool isRenewal;

  factory RoleSubscriptionData.fromJson(JsonMap json) {
    if (json
        case {
          'role_subscription_listing_id': String
              roleSubscriptionListingIdString,
          'tier_name': String tierName,
          'total_months_subscribed': int totalMonthsSubscribed,
          'is_renewal': bool isRenewal,
        }) {
      return RoleSubscriptionData._(
        Snowflake.fromJson(roleSubscriptionListingIdString),
        tierName,
        totalMonthsSubscribed,
        isRenewal,
      );
    } else {
      throw MalformedJsonMapException({
        'role_subscription_listing_id': String,
        'tier_name': String,
        'total_months_subscribed': int,
        'is_renewal': bool,
      }, json);
    }
  }
}
