import 'package:bloc/bloc.dart';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:foto_share/secret/token.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;

part 'record_state.dart';
part 'record_event.dart';


class RecordBloc extends Bloc<RecordEvent, RecordState> {

  RecordBloc() : super(SongInitial()) {
    on<OnListenToSong>(_recordSong);
  }



  FutureOr<void> _recordSong(OnListenToSong event, Emitter emit) async {
      
  }

}