part of 'record_bloc.dart';
abstract class RecordEvent extends Equatable{
  const RecordEvent();
  @override
  List<Object> get props => [];
}
class RecordUpdateEvent extends RecordEvent{}

class OnSendSongFile extends RecordEvent{
  final Map<String, dynamic> songFile;

  OnSendSongFile({required this.songFile});

  @override
  List<Object> get props => [songFile];
}



class OnListenToSong extends RecordEvent{}