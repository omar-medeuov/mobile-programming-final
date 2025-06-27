import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            final post = state.post;
            return Center(child: AnimatedPostCard(post: post));
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          }
          // Initial state: Show a button to fetch post
          return Center(
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<PostBloc>(context).add(FetchPostEvent());
              },
              child: Text('Load Post'),
            ),
          );
        },
      ),
    );
  }
}

class AnimatedPostCard extends StatefulWidget {
  final Map<String, dynamic> post;
  const AnimatedPostCard({Key? key, required this.post}) : super(key: key);

  @override
  State<AnimatedPostCard> createState() => _AnimatedPostCardState();
}

class _AnimatedPostCardState extends State<AnimatedPostCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _slideAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Card(
          margin: EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.post['title'] ?? '',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                SizedBox(height: 18),
                Text(
                  widget.post['body'] ?? '',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
