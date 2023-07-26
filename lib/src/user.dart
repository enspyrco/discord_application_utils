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
  final String? email;

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
          'global_name': String? globalName,
          'avatar': String? avatar,
        }) {
      var (
        bool? bot,
        bool? system,
        bool? mfaEnabled,
        String? banner,
        int? accentColor,
        String? locale,
        bool? verified,
        String? email,
        int? flags,
        int? premiumType,
        int? publicFlags,
        String? avatarDecoration,
      ) = (
        json['bot'] as bool?,
        json['system'] as bool?,
        json['mfa_enabled'] as bool?,
        json['banner'] as String?,
        json['accent_color'] as int?,
        json['locale'] as String?,
        json['verified'] as bool?,
        json['email'] as String?,
        json['flags'] as int?,
        json['premium_type'] as int?,
        json['public_flags'] as int?,
        json['avatar_decoration'] as String?,
      );
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
      throw MalformedJsonMapException({
        'id': String,
        'username': String,
        'discriminator': String,
        'global_name': Nullable<String>,
        'avatar': Nullable<String>,
        'bot': Nullable<bool>,
        'system': Nullable<bool>,
        'mfa_enabled': Nullable<bool>,
        'banner': Nullable<String>,
        'accent_color': Nullable<int>,
        'locale': Nullable<String>,
        'verified': Nullable<bool>,
        'email': Nullable<String>,
        'flags': Nullable<int>,
        'premium_type': Nullable<int>,
        'public_flags': Nullable<int>,
        'avatar_decoration': Nullable<String>,
      }, json);
    }
  }
}
