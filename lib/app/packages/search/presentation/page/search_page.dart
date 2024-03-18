import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/packages/search/presentation/bloc/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({required this.cubit, super.key});

  final SearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    final tokens = OwnTheme.getDesignTokensOf(context);
    return BlocProvider(
      create: (context) => cubit..load(),
      child: Scaffold(
        backgroundColor: tokens.colors.primary,
      ),
    );
  }
}
