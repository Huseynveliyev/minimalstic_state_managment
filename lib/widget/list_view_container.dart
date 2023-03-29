import 'package:flutter/material.dart';
import 'package:minimalistic_state_managment/state/list_view_state.dart';

import '../locator/locator.dart';
import '../model/post.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<ListViewState>();
    return ValueListenableBuilder<List<Post>>(
      valueListenable: state.postsNotifier,
      builder: (context, postsNotifierValue,_) {
        return ListView(
            physics: const BouncingScrollPhysics(),
            children: postsNotifierValue
                .map(
                  (post) => ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    leading: CircleAvatar(
                      child: Text(
                        post.id.toString(),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          state.postRemoveTapped(post);
                        },
                        icon: const Icon(Icons.remove_circle_outline)),
                  ),
                )
                .toList());
      }
    );
  }
}
