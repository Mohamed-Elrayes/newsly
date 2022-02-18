
import 'package:flutter/widgets.dart';
import '../../data/data.dart';
import '../../presentation/pages/pages.dart';

import 'icon_constant.dart';

List<HeadlineArticles> kindArticles = [
  HeadlineArticles(headLine: 'General', isSelected: true),
  HeadlineArticles(headLine: 'business'),
  HeadlineArticles(headLine: 'Entertainment'),
  HeadlineArticles(headLine: 'Health'),
  HeadlineArticles(headLine: 'Science'),
  HeadlineArticles(headLine: 'Sports'),
  HeadlineArticles(headLine: 'technology'),
];
//######################################################
final Map<Widget, IconSelectItem> bottomNavPages = {
  const ArticlesHomePage(): IconSelectItem(
      label: 'home', icon: homeOutlineIcon, activeIcon: homeIcon),
  const SearchPage(): IconSelectItem(
      label: 'search', icon: searchOutlineIcon, activeIcon: searchIcon),
  const BookmarkPage(): IconSelectItem(
      label: 'favorite', icon: bookMarkOutLineIcon, activeIcon: bookMarkIcon),
  const SettingPage(): IconSelectItem(
      label: 'setting', icon: settingOutLine, activeIcon: settingIcon),
};

List<BottomNavigationBarItem> get bottomNavItems => [
      ...bottomNavPages.values
          .map(
            (e) => BottomNavigationBarItem(
              label: e.label,
              icon: Icon(e.icon),
              activeIcon: Icon(e.activeIcon),
            ),
          )
          .toList()
    ];

List<PopUpModel> popItemList = [
  PopUpModel(title: 'Share', icon: shareIcon),
  PopUpModel(title: 'Bookmark', icon: bookMarkIcon),
];
List<IconSelectItem> socialMediaList = [
  IconSelectItem(
    icon: googleIcon,
  ),
  IconSelectItem(
    icon: facebookIcon,
  ),
  IconSelectItem(
    icon: twitterIcon,
  )
];

List<SettingModel> dataSettingItem = [
  SettingModel(label: 'Profile', iconLabel: profileIcon),
  SettingModel(label: 'Account', iconLabel: accountIcon),
  SettingModel(label: 'Interests', iconLabel: interestsIcon),
  SettingModel(label: 'Notifications', iconLabel: notificationIcon),
  SettingModel(label: 'Dark Mode', iconLabel: moonIcon),
  SettingModel(label: 'Terms & Conditions', iconLabel: termsAndAboutIcon),
  SettingModel(label: 'About', iconLabel: termsAndAboutIcon),
  SettingModel(label: 'Log Out', iconLabel: logoutIcon),
];
