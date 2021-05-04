import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krishnakumar_cn/bloc/app_bloc.dart';
import 'package:krishnakumar_cn/repositories/data_provider_repository.dart';

import 'app/views/app_view.dart';
import 'helpers/configure_nonweb.dart'
    if (dart.library.html) 'helpers/configure_web.dart';

void main() {
  configureApp();
  runApp(App(
    dataRepository: DataRepository(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key, required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(key: key);

  get widgets => [Container(), Container()];
  final DataRepository _dataRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DataRepository>.value(
          value: _dataRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AppBloc(dataProviderRepository: _dataRepository))
        ],
        child: AppView(),
      ),
    );
  }
}
