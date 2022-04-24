part of 'record_bloc.dart';

abstract class RecordState extends Equatable {
  const RecordState();
  
  @override
  List<Object> get props => [];
}

class SongInitial extends RecordState {}


class SongSuccessState extends RecordState{
  final Map<String, dynamic> songInfoJson;

  SongSuccessState({required this.songInfoJson});

  @override
  List<Object> get props => [songInfoJson];
}