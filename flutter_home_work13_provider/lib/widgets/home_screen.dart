import 'package:flutter_home_work13_provider/widgets/categories_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_home_work13_provider/models/app_tab.dart';
import 'package:flutter_home_work13_provider/models/filter.dart';
import 'package:flutter_home_work13_provider/notifiers/init_change_notifier.dart';
import 'package:flutter_home_work13_provider/widgets/filter_button.dart';
import 'package:flutter_home_work13_provider/widgets/loading_indicator.dart';
import 'package:flutter_home_work13_provider/widgets/speakers_list.dart';
import 'package:flutter_home_work13_provider/widgets/talks_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RatingAppState>(builder: (context, state, child) {
      if (!state.isLoaded) {
        return const LoadingIndicator();
      } else {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.category),
              onPressed: () {
                // print(state.products[1].category.toString());
              },
            ),
            title: const Text('E-Commerce'),
            actions: [
              FilterButton(
                visible: state.activeTabIndex == AppTab.speakers.index,
                activeFilter: state.activeFilter ?? Filter.all,
                onSelected: state.updateFilter,
              ),
            ],
          ),
          body: state.activeTabIndex == AppTab.speakers.index
              ? SpeakerList(
                  speakers: state.filteredSpeakers,
                  ratingChanged: (speaker, rating) =>
                      state.updateSpeaker(speaker.copyWith(rating: rating)))
              : state.activeTabIndex == AppTab.talks.index
                  ? TalksList(
                      talks: state.talks,
                      onTalkTapped: (talk) => state.updateTalk(
                          talk.copyWith(isFavourite: !talk.isFavourite)),
                    )
                  : CategoriesList(
                      categories: state.categories,
                      onTalkTapped: () {},
                    ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.activeTabIndex,
            onTap: state.updateTab,
            items: AppTab.values.map((tab) {
              return BottomNavigationBarItem(
                icon: Icon(
                  tab == AppTab.speakers
                      ? Icons.group
                      : tab == AppTab.talks
                          ? Icons.list
                          : Icons.category,
                ),
                label: tab == AppTab.speakers
                    ? 'Speakers'
                    : tab == AppTab.talks
                        ? 'Schedule'
                        : 'Категории',
              );
            }).toList(),
          ),
        );
      }
    });
  }
}
