import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/Tag.dart';
import 'package:confnect/model/Talk.dart';
import 'package:flutter/material.dart';

import '../../model/User.dart';

class UserRole {
  static const ADMIN = 'admin';
  static const HOST = 'host';
  static const ATTENDEE = 'attendee';
}

abstract class Database {
  String getAppName();
  List<User> getUsers();
  List<Forum> getForums();
  Forum getForum(int id);
  List<Post> getForumPosts(int forumId);
  List<Post> getPosts();
  bool login(String username, String password);
  void register(
      String fullname, String username, String password, String profilePicURL);
  void addPost(
      int forumId, String username, String title, String text, Date date);
  User getUser(String username);
  List<Tag> getTags();
  List<Talk> getTalks();
  bool existsUser(String username);
  bool hasRole(String username, String role);
  void addTalk(String title, String description, String speaker, String image,
      List<Tag> tags);
  void editTalk(int talkId, String title, String description, String speaker,
      String image, List<Tag> tags);
  Tag createTag(String name);
  void addTag(Tag tag);
  void deleteTalk(Talk talk);
  bool isTagNew(Tag tag);
  Meetup createMeetup(Post post, String location, DateTime date, TimeOfDay time,
      String description, User creator);
  List<Forum> getUserPopularForums(User user);
  List<Post> getForumsPopularPosts(List<Forum> forums);
  void changePinnedComment(Post post, Comment comment);
}
