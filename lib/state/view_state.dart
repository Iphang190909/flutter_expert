import 'package:freezed_annotation/freezed_annotation.dart';
part 'view_state.freezed.dart';

@freezed
class ViewState with _$ViewState {
  const factory ViewState.initial() = ViewInitial;
  const factory ViewState.loading() = ViewLoading;
  const factory ViewState.success() = ViewSuccess;
  const factory ViewState.error() = ViewError;
}
