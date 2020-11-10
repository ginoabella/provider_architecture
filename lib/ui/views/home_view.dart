import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/view_models/home_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.getPosts(Provider.of<User>(context).id);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(),
      ),
    );
  }
}

// TODO: Last part
