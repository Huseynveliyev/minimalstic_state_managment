import 'package:flutter/material.dart';

import '../model/post.dart';

class ListViewState {
  ValueNotifier<List<Post>> postsNotifier = ValueNotifier<List<Post>>([
    Post(
      1,
      1,
      "optio moleata quia eum",
      "magni doloribus qui repudiandae vero nisi sit quos veniam quod sed accusamus veritatis error",
    ),
    Post(
      1,
      2,
      "molestias id quia eum",
      "cum officia vel magni doloribus qui repudiandae vero nisi sit quos veniam quod sed accusamus veritatis error",
    ),
    Post(
      1,
      3,
      "oid quia eum",
      "quo et qui repudiandae vero nisi sit quos veniam quod sed accusamus veritatis error",
    ),
    Post(
      1,
      4,
      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla",
    ),
    Post(
      1,
      5,
      "optio molestias id quia eum",
      " magni doloribus qui repudiandae vero nisi sit quos veniam quod sed accusamus veritatis error",
    ),
    Post(
      1,
      6,
      "molestias id quia eum",
      "cum officia vel magni doloribus qui repudiandae vero nisi sit quos veniam quod sed accusamus veritatis error",
    ),
    Post(
      1,
      7,
      "molestias id quia eum",
      "cum officia vel magni doloribus qui repudiandae vero nisi sit quos veniam quod sed accusamus veritatis error",
    ),
  ]);

  void postRemoveTapped(Post postToRemove) {
    postsNotifier.value.remove(postToRemove);
    // postsNotifier.value = [...postsNotifier.value]; // 1 ci yol
    postsNotifier.value = List<Post>.from(postsNotifier.value);
    debugPrint(postsNotifier.value.toString());
  }

  void addPostTapped(Post postToAdd) {
    postsNotifier.value.add(postToAdd);
    postsNotifier.value = List<Post>.from(postsNotifier.value);
  }
}
