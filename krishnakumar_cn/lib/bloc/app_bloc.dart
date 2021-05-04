import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:krishnakumar_cn/app/models/education_data.dart';
import 'package:krishnakumar_cn/app/models/tech_data.dart';
import 'package:krishnakumar_cn/app/models/work_experience.dart';
import 'package:krishnakumar_cn/enums/sections.dart';
import 'package:krishnakumar_cn/repositories/data_provider_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required DataRepository dataProviderRepository})
      : super(AppState(
          workExperiences: dataProviderRepository.getWorkExperience(),
          educationData: dataProviderRepository.getEducationData(),
          techData: dataProviderRepository.getTechData(),
        ));
  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is SelectedSectionChanged) {
      yield state.copyWith(selectedSection: event.section);
    }
  }
}
