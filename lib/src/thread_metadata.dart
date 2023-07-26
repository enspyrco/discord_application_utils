import 'package:json_utils/json_utils.dart';

// https://discord.com/developers/docs/resources/channel#thread-metadata-object-thread-metadata-structure
class ThreadMetadata {
  ThreadMetadata._(
    this.archived,
    this.auto_archive_duration,
    this.archive_timestamp,
    this.locked,
    this.invitable,
    this.create_timestamp,
  );
  // whether the thread is archived
  final bool archived;

  // the thread will stop showing in the channel list after auto_archive_duration minutes of inactivity, can be set to: 60, 1440, 4320, 10080
  final int auto_archive_duration;

  // timestamp when the thread's archive status was last changed, used for calculating recent activity
  // ISO8601 timestamp
  final String archive_timestamp;

  // whether the thread is locked; when a thread is locked, only users with MANAGE_THREADS can unarchive it
  final bool locked;

  // whether non-moderators can add other non-moderators to a thread; only available on private threads
  final bool? invitable;

  // timestamp when the thread was created; only populated for threads created after 2022-01-09
  // ISO8601 timestamp
  final String? create_timestamp;

  factory ThreadMetadata.fromJson(JsonMap json) {
    if (json
        case {
          'archived': bool archived,
          'auto_archive_duration': int auto_archive_duration,
          'archive_timestamp': String archive_timestamp,
          'locked': bool locked,
          'invitable': bool? invitable,
          'create_timestamp': String? create_timestamp,
        }) {
      return ThreadMetadata._(
        archived,
        auto_archive_duration,
        archive_timestamp,
        locked,
        invitable,
        create_timestamp,
      );
    } else {
      throw MalformedJsonException('''
      Expected:
        {
          'archived': bool,
          'auto_archive_duration': int,
          'archive_timestamp': String,
          'locked': bool,
          'invitable': bool?,
          'create_timestamp': String?,
        }
      ''', json);
    }
  }
}
