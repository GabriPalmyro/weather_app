import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/bloc/home_cubit.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/bloc/home_states.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/page/home_page_error.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/page/home_page_loading.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/page/home_page_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.cubit, super.key});

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    final tokens = OwnTheme.getDesignTokensOf(context);
    return BlocProvider(
      create: (context) => cubit..load(),
      child: Scaffold(
        backgroundColor: tokens.colors.grey,
        body: RefreshIndicator(
          displacement: 80,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () async => await cubit.load(),
          child: SingleChildScrollView(
            child: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const HomePageLoading();
                } else if (state is HomeLoaded) {
                  return HomePageSuccess(cityWeather: state.cityWeather);
                } else {
                  return HomePageError(
                    onRetry: () {
                      cubit.load();
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
