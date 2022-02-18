import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly_app/core/constants/constant_iteration.dart';
import '../../logic/cubit/bottom_nav_cubit.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bottomNavData = context.read<BottomNavCubit>();
    return BlocBuilder<BottomNavCubit, int>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) { 
        return Scaffold(
          body: bottomNavPages.keys.elementAt(state),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: bottomNavData.onTapIconPage,
            items: bottomNavItems,
          ),
        );
      },
    );
  }
}