import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/packages/dash_tab/presentation/bloc/connection_status_cubit.dart';
import 'package:cloudwalk_challenge/app/packages/dash_tab/presentation/bloc/connection_status_state.dart';
import 'package:cloudwalk_challenge/app/packages/dash_tab/presentation/widgets/tabbar/tab_bar_widget.dart';
import 'package:cloudwalk_challenge/app/utils/fade_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashTabPage extends StatefulWidget {
  const DashTabPage({required this.views, required this.connectionCubit});
  final List<Widget> views;
  final ConnectionStatusCubit connectionCubit;

  @override
  _DashTabPageState createState() => _DashTabPageState();
}

class _DashTabPageState extends State<DashTabPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.views.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = OwnTheme.getDesignTokensOf(context);
    return BlocProvider(
      create: (context) => widget.connectionCubit..init(),
      child: Scaffold(
        backgroundColor: theme.colors.grey,
        bottomNavigationBar: TabBarWidget(
          index: _tabController.index,
          onTap: (index) {
            setState(() {
              _tabController.index = index;
            });
          },
        ),
        body: Stack(
          children: [
            BlocBuilder<ConnectionStatusCubit, ConnectionStatusState>(
              buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
              builder: (context, state) {
                return FadeSwitcher(
                  child: state is ConnectionStatusConnected
                      ? const SizedBox()
                      : Container(
                          color: theme.colors.error,
                          child: Center(
                            child: Text(
                              'No internet connection',
                              style: TextStyle(
                                color: theme.colors.white,
                                fontSize: theme.font.size.sm,
                                fontWeight: theme.font.weight.semiBold,
                                fontFamily: theme.font.family.base,
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),
            IndexedStack(
              index: _tabController.index,
              children: widget.views,
            ),
          ],
        ),
      ),
    );
  }
}
