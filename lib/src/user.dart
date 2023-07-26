import 'package:json_utils/json_utils.dart';

class User {
  User._(
    this.id,
    this.username,
    this.discriminator,
    this.globalName,
    this.avatar,
    this.bot,
    this.system,
    this.mfaEnabled,
    this.banner,
    this.accentColor,
    this.locale,
    this.verified,
    this.email,
    this.flags,
    this.premiumType,
    this.publicFlags,
    this.avatarDecoration,
  );

  // the user's id
  // OAuth2 Scope: identify
  // snowflake
  final String id;

  // the user's username, not unique across the platform
  // OAuth2 Scope: identify
  final String username;

  // the user's Discord-tag
  // OAuth2 Scope: identify
  final String discriminator;

  // the user's display name, if it is set. For bots, this is the application name
  // OAuth2 Scope: identify
  final String? globalName;

  // the user's avatar hash
  // OAuth2 Scope: identify
  final String? avatar;

  // whether the user belongs to an OAuth2 application
  // OAuth2 Scope: identify
  final bool? bot;

  // whether the user is an Official Discord System user (part of the urgent message system)
  // OAuth2 Scope: identify
  final bool? system;

  // whether the user has two factor enabled on their account
  // OAuth2 Scope: identify
  final bool? mfaEnabled;

  // the user's banner hash
  // OAuth2 Scope: identify
  final String? banner;

  // the user's banner color encoded as an integer representation of hexadecimal color code
  // OAuth2 Scope: identify
  final int? accentColor;

  // the user's chosen language option
  // OAuth2 Scope: identify
  final String? locale;

  // whether the email on this account has been verified	email
  // OAuth2 Scope:
  final bool? verified;

  // the user's email
  // OAuth2 Scope: email
  final String email;

  // the flags on a user's account
  // OAuth2 Scope: identify
  final int? flags;

  // the type of Nitro subscription on a user's account
  // OAuth2 Scope: identify
  final int? premiumType;

  // the public flags on a user's account
  // OAuth2 Scope: identify
  final int? publicFlags;

  // the user's avatar decoration hash
  // OAuth2 Scope: identify
  final String? avatarDecoration;

  factory User.fromJson(JsonMap json) {
    if (json
        case {
          'id': String id,
          'username': String username,
          'discriminator': String discriminator,
          'globalName': String? globalName,
          'avatar': String? avatar,
          'bot': bool? bot,
          'system': bool? system,
          'mfaEnabled': bool? mfaEnabled,
          'banner': String? banner,
          'accentColor': int? accentColor,
          'locale': String? locale,
          'verified': bool? verified,
          'email': String email,
          'flags': int? flags,
          'premiumType': int? premiumType,
          'publicFlags': int? publicFlags,
          'avatarDecoration': String? avatarDecoration,
        }) {
      return User._(
        id,
        username,
        discriminator,
        globalName,
        avatar,
        bot,
        system,
        mfaEnabled,
        banner,
        accentColor,
        locale,
        verified,
        email,
        flags,
        premiumType,
        publicFlags,
        avatarDecoration,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'id': String,
          'username': String,
          'discriminator': String,
          'globalName': String?,
          'avatar': String?,
          'bot': bool?,
          'system': bool?,
          'mfaEnabled': bool?,
          'banner': String?,
          'accentColor': int?,
          'locale': String?,
          'verified': bool?,
          'email': String,
          'flags': int?,
          'premiumType': int?,
          'publicFlags': int?,
          'avatarDecoration': String?,
        }
      ''', json);
    }
  }
}
