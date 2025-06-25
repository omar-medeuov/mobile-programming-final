import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:https_project/model/profile_user.dart';
import 'package:https_project/profile/bloc/profile_bloc.dart';


class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late ProfileBloc profileBloc;
  List<ProfileUser> profileUserList = [];

  @override
  void initState() {
    profileBloc = ProfileBloc();
    profileBloc.add(FetchProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
          bloc: profileBloc,
          listener: (context, state) {
            print("hererrer $state");
            if (state is FailureProfileState) {
              return;
            }
          },
          builder: (context, state) {
            if (state is LoadingProfileState) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            }
            if (state is LoadedProfileState) {
              profileUserList = state.profileUser;
              return buildBody();
            }
            return Container();
          }),
    );
  }

  Widget buildBody() {
    List<Widget> children = [];
    for (var item in profileUserList) {
      children.add(Stack(
        children: [
          Text(item.title),
        ],
      ));
    }
    return Center(
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }
}
