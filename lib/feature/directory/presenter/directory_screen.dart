import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/directory/presenter/directory_list_content.dart';
import 'package:refugee_care_mobile/feature/directory/provider/directory_view_model.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_loading.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class DirectoryScreen extends StatefulHookConsumerWidget {
  const DirectoryScreen({super.key, required this.title});

  final String title;

  @override
  ConsumerState<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends ConsumerState<DirectoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(directoryViewModelProvider.notifier).fetchDirectories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(directoryViewModelProvider);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
          shadowColor: null,
          centerTitle: false,
          backgroundColor: AppColors.primaryLight,
          title: Text(
            'Directory',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontSize: 18),
          ),
        ),
        body: state.isLoading
            ? RefugeeLinearLoading()
            : DirectoryListContent(directories: state.directories));
  }
}
