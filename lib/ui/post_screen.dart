// ignore_for_file: file_names

import 'package:bloc_prac/bloc/posts/posts_bloc.dart';
import 'package:bloc_prac/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    context.read<PostsBloc>().add(const FetchPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post API'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.completed:
              return ListView.builder(
                  itemCount: state.postList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${state.postList[index].id}'),
                      subtitle: Text(state.postList[index].name!),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    );
                  });
            case Status.error:
              return const Center(child: Text('Failed to fetch posts'));
          }
        },
      ),
    );
  }
}
