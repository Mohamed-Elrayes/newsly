import 'dart:io';
import 'package:newsly_app/presentation/news_app.dart';
import 'package:path_provider/path_provider.dart' as path_provide;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'data/models/generate/bookmark_hive/bookmark_item.dart';
import 'data/repositories/auth_repository.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await path_provide.getApplicationDocumentsDirectory();
  await Firebase.initializeApp();
  final authRepository = AuthRepository();
  Hive.init(directory.path);
  Hive.registerAdapter(BookmarkHiveAdapter());

  runApp(NewsApp(authRepository: authRepository));
}


