import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/functions/save_and_get_map_to_list_with_shared_pref.dart';

class FearsCubit extends Cubit<List<Map<String, dynamic>>> {
  FearsCubit() : super([]);

  Future<void> loadFears() async {
    final fears = await getListOfMapsFromSharedPref(kFearsListShardPref);
    emit(fears);
  }
}