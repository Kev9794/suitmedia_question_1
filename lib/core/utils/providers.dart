import 'package:suitmedia_question_1/core/utils/injector.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_bloc.dart';

class Providers {
  static final List<BlocProvider> init = [
    BlocProvider<UserBloc>(create: (context) => di.locator<UserBloc>()),
  ];
}
