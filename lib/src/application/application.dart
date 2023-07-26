import 'package:json_utils/json_utils.dart';

import '../guild/guild.dart';
import '../snowflake.dart';
import '../teams/team.dart';
import '../user.dart';
import 'install_params.dart';

// https://discord.com/developers/docs/resources/application#application-object-application-structure
final class Application {
  const Application._(
    this.id,
    this.name,
    this.icon,
    this.description,
    this.rpcOrigins,
    this.botPublic,
    this.botRequireCodeGrant,
    this.termsOfServiceUrl,
    this.privacyPolicyUrl,
    this.owner,
    this.summary,
    this.verifyKey,
    this.team,
    this.guildId,
    this.guild,
    this.primarySkuId,
    this.slug,
    this.coverImage,
    this.flags,
    this.approximateGuildCount,
    this.tags,
    this.installParams,
    this.customInstallUrl,
    this.roleConnectionsVerificationUrl,
  );

  // the id of the app
  final Snowflake id;

  // the name of the app
  final String name;

  // the icon hash of the app
  final String? icon;

  // the description of the app
  final String description;

  // an array of rpc origin urls, if rpc is enabled
  final List<String> rpcOrigins;

  // when false only app owner can join the app's bot to guilds
  final bool botPublic;

  // when true the app's bot will only join upon completion of the full oauth2 code grant flow
  final bool botRequireCodeGrant;

  // the url of the app's terms of service
  final String? termsOfServiceUrl;

  // the url of the app's privacy policy
  final String privacyPolicyUrl;

  // partial user object containing info on the owner of the application
  final User? owner;

  // deprecated and will be removed in v11. An empty string.
  // (deprecated)
  final String summary;

  // the hex encoded key for verification in interactions and the GameSDK's GetTicket
  final String verifyKey;

  // if the application belongs to a team, this will be a list of the members of that team
  final Team? team;

  // guild associated with the app. For example, a developer support server.
  final Snowflake guildId;

  // a partial object of the associated guild
  final Guild? guild;

  // if this application is a game sold on Discord, this field will be the id of the "Game SKU" that is created, if exists
  final Snowflake primarySkuId;

  // if this application is a game sold on Discord, this field will be the URL slug that links to the store page
  final String? slug;

  // the application's default rich presence invite cover image hash
  final String? coverImage;

  // the application's public flags
  final int? flags;

  // an approximate count of the app's guild membership.
  final int? approximateGuildCount;

  // up to 5 tags describing the content and functionality of the application
  final List<String> tags;

  // settings for the application's default in-app authorization link, if enabled
  final InstallParams? installParams;

  // the application's default custom authorization link, if enabled
  final String? customInstallUrl;

  // the application's role connection verification entry point, which when configured will render the app as a verification method in the guild role verification configuration
  final String? roleConnectionsVerificationUrl;

  factory Application.fromJson(JsonMap json) {
    if (json
        case {
          'id': String idString,
          'name': String name,
          'icon': String? icon,
          'description': String description,
          'rpc_origins': JsonList rpcOriginsJsonList,
          'bot_public': bool botPublic,
          'bot_require_code_grant': bool botRequireCodeGrant,
          'terms_of_service_url': String? termsOfServiceUrl,
          'privacy_policy_url': String privacyPolicyUrl,
          'owner': JsonMap? ownerJsonMap,
          'summary': String summary,
          'verify_key': String verifyKey,
          'team': JsonMap? teamJsonMap,
          'guild_id': String guildIdString,
          'guild': JsonMap? guildJsonMap,
          'primary_sku_id': String primarySkuIdString,
          'slug': String? slug,
          'cover_image': String? coverImage,
          'flags': int? flags,
          'approximate_guild_count': int? approximateGuildCount,
          'tags': JsonList tagsJsonList,
          'install_params': JsonMap? installParamsJsonMap,
          'custom_install_url': String? customInstallUrl,
          'role_connections_verification_url': String?
              roleConnectionsVerificationUrl,
        }) {
      return Application._(
        Snowflake.fromJson(idString),
        name,
        icon,
        description,
        List<String>.from(rpcOriginsJsonList),
        botPublic,
        botRequireCodeGrant,
        termsOfServiceUrl,
        privacyPolicyUrl,
        ownerJsonMap == null ? null : User.fromJson(ownerJsonMap),
        summary,
        verifyKey,
        teamJsonMap == null ? null : Team.fromJson(teamJsonMap),
        Snowflake.fromJson(guildIdString),
        guildJsonMap == null ? null : Guild.fromJson(guildJsonMap),
        Snowflake.fromJson(primarySkuIdString),
        slug,
        coverImage,
        flags,
        approximateGuildCount,
        List<String>.from(tagsJsonList),
        installParamsJsonMap == null
            ? null
            : InstallParams.fromJson(installParamsJsonMap),
        customInstallUrl,
        roleConnectionsVerificationUrl,
      );
    } else {
      throw MalformedJsonMapException({
        'id': String,
        'name': String,
        'icon': Nullable<String>,
        'description': String,
        'rpc_origins': JsonList,
        'bot_public': bool,
        'bot_require_code_grant': bool,
        'terms_of_service_url': Nullable<String>,
        'privacy_policy_url': String,
        'owner': Nullable<JsonMap>,
        'summary': String,
        'verify_key': String,
        'team': Nullable<JsonMap>,
        'guild_id': String,
        'guild': Nullable<JsonMap>,
        'primary_sku_id': String,
        'slug': Nullable<String>,
        'cover_image': Nullable<String>,
        'flags': Nullable<int>,
        'approximate_guild_count': Nullable<int>,
        'tags': JsonList,
        'install_params': Nullable<JsonMap>,
        'custom_install_url': Nullable<String>,
        'role_connections_verification_url': Nullable<String>,
      }, json);
    }
  }
}
