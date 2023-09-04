import 'package:equatable/equatable.dart';

enum States { init, loading, success, error }

///  -Same as sealed class in Kotlin.<br>
///  -Can not be extended or allow an object of it to be created.
class StateResource<T> extends Equatable {
  final T? data;
  final String? error;
  final bool isInitState;
  final bool isLoadingState;

  const StateResource._({
    this.data,
    this.error,
    this.isInitState = false,
    this.isLoadingState = false,
  });

  factory StateResource.success(T data) => StateResource<T>._(data: data);

  factory StateResource.error(String error) => StateResource<T>._(error: error);

  factory StateResource.loading({T? data}) =>
      StateResource<T>._(data: data, isLoadingState: true);

  factory StateResource.init() => StateResource<T>._(isInitState: true);

  bool isLoading(){
    return isLoadingState;
  }

  bool isError(){
    return !isLoadingState && !isInitState && error != null;
  }

  bool isSuccess(){
    return !isLoadingState && !isInitState && data != null;
  }

  bool isInit(){
    return isInitState;
  }

  @override
  List<Object?> get props => [data, error, isInitState, isLoadingState];
}