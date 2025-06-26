import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_bloc.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            final news = state.news;
            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return AnimatedNewsItem(
                  key: ValueKey(news[index]['id']),
                  title: news[index]['title'],
                  body: news[index]['body'],
                  index: index,
                );
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.message));
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent());
              },
              child: Text('Load News'),
            ),
          );
        },
      ),
    );
  }
}

class AnimatedNewsItem extends StatefulWidget {
  final String title;
  final String body;
  final int index;

  const AnimatedNewsItem({Key? key, required this.title, required this.body, required this.index}) : super(key: key);

  @override
  _AnimatedNewsItemState createState() => _AnimatedNewsItemState();
}

class _AnimatedNewsItemState extends State<AnimatedNewsItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500 + widget.index * 60),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    Future.delayed(Duration(milliseconds: widget.index * 80), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: ListTile(
          title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(widget.body),
        ),
      ),
    );
  }
}
