// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() gethomescreendata,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? gethomescreendata,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? gethomescreendata,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Gethomescreendata value) gethomescreendata,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Gethomescreendata value)? gethomescreendata,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Gethomescreendata value)? gethomescreendata,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GethomescreendataCopyWith<$Res> {
  factory _$$GethomescreendataCopyWith(
          _$Gethomescreendata value, $Res Function(_$Gethomescreendata) then) =
      __$$GethomescreendataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GethomescreendataCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$Gethomescreendata>
    implements _$$GethomescreendataCopyWith<$Res> {
  __$$GethomescreendataCopyWithImpl(
      _$Gethomescreendata _value, $Res Function(_$Gethomescreendata) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Gethomescreendata implements Gethomescreendata {
  const _$Gethomescreendata();

  @override
  String toString() {
    return 'HomeEvent.gethomescreendata()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Gethomescreendata);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() gethomescreendata,
  }) {
    return gethomescreendata();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? gethomescreendata,
  }) {
    return gethomescreendata?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? gethomescreendata,
    required TResult orElse(),
  }) {
    if (gethomescreendata != null) {
      return gethomescreendata();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Gethomescreendata value) gethomescreendata,
  }) {
    return gethomescreendata(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Gethomescreendata value)? gethomescreendata,
  }) {
    return gethomescreendata?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Gethomescreendata value)? gethomescreendata,
    required TResult orElse(),
  }) {
    if (gethomescreendata != null) {
      return gethomescreendata(this);
    }
    return orElse();
  }
}

abstract class Gethomescreendata implements HomeEvent {
  const factory Gethomescreendata() = _$Gethomescreendata;
}

/// @nodoc
mixin _$HomeState {
  String get stateid => throw _privateConstructorUsedError;
  List<HotAndNewData> get pastyearmovielist =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingmovielist =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get tensedramemovielist =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get southIndianmovielist =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingTvlist => throw _privateConstructorUsedError;
  bool get isloading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String stateid,
      List<HotAndNewData> pastyearmovielist,
      List<HotAndNewData> trendingmovielist,
      List<HotAndNewData> tensedramemovielist,
      List<HotAndNewData> southIndianmovielist,
      List<HotAndNewData> trendingTvlist,
      bool isloading,
      bool hasError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateid = null,
    Object? pastyearmovielist = null,
    Object? trendingmovielist = null,
    Object? tensedramemovielist = null,
    Object? southIndianmovielist = null,
    Object? trendingTvlist = null,
    Object? isloading = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      stateid: null == stateid
          ? _value.stateid
          : stateid // ignore: cast_nullable_to_non_nullable
              as String,
      pastyearmovielist: null == pastyearmovielist
          ? _value.pastyearmovielist
          : pastyearmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingmovielist: null == trendingmovielist
          ? _value.trendingmovielist
          : trendingmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tensedramemovielist: null == tensedramemovielist
          ? _value.tensedramemovielist
          : tensedramemovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southIndianmovielist: null == southIndianmovielist
          ? _value.southIndianmovielist
          : southIndianmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingTvlist: null == trendingTvlist
          ? _value.trendingTvlist
          : trendingTvlist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stateid,
      List<HotAndNewData> pastyearmovielist,
      List<HotAndNewData> trendingmovielist,
      List<HotAndNewData> tensedramemovielist,
      List<HotAndNewData> southIndianmovielist,
      List<HotAndNewData> trendingTvlist,
      bool isloading,
      bool hasError});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateid = null,
    Object? pastyearmovielist = null,
    Object? trendingmovielist = null,
    Object? tensedramemovielist = null,
    Object? southIndianmovielist = null,
    Object? trendingTvlist = null,
    Object? isloading = null,
    Object? hasError = null,
  }) {
    return _then(_$_HomeState(
      stateid: null == stateid
          ? _value.stateid
          : stateid // ignore: cast_nullable_to_non_nullable
              as String,
      pastyearmovielist: null == pastyearmovielist
          ? _value._pastyearmovielist
          : pastyearmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingmovielist: null == trendingmovielist
          ? _value._trendingmovielist
          : trendingmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tensedramemovielist: null == tensedramemovielist
          ? _value._tensedramemovielist
          : tensedramemovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southIndianmovielist: null == southIndianmovielist
          ? _value._southIndianmovielist
          : southIndianmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingTvlist: null == trendingTvlist
          ? _value._trendingTvlist
          : trendingTvlist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required this.stateid,
      required final List<HotAndNewData> pastyearmovielist,
      required final List<HotAndNewData> trendingmovielist,
      required final List<HotAndNewData> tensedramemovielist,
      required final List<HotAndNewData> southIndianmovielist,
      required final List<HotAndNewData> trendingTvlist,
      required this.isloading,
      required this.hasError})
      : _pastyearmovielist = pastyearmovielist,
        _trendingmovielist = trendingmovielist,
        _tensedramemovielist = tensedramemovielist,
        _southIndianmovielist = southIndianmovielist,
        _trendingTvlist = trendingTvlist;

  @override
  final String stateid;
  final List<HotAndNewData> _pastyearmovielist;
  @override
  List<HotAndNewData> get pastyearmovielist {
    if (_pastyearmovielist is EqualUnmodifiableListView)
      return _pastyearmovielist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastyearmovielist);
  }

  final List<HotAndNewData> _trendingmovielist;
  @override
  List<HotAndNewData> get trendingmovielist {
    if (_trendingmovielist is EqualUnmodifiableListView)
      return _trendingmovielist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingmovielist);
  }

  final List<HotAndNewData> _tensedramemovielist;
  @override
  List<HotAndNewData> get tensedramemovielist {
    if (_tensedramemovielist is EqualUnmodifiableListView)
      return _tensedramemovielist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tensedramemovielist);
  }

  final List<HotAndNewData> _southIndianmovielist;
  @override
  List<HotAndNewData> get southIndianmovielist {
    if (_southIndianmovielist is EqualUnmodifiableListView)
      return _southIndianmovielist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndianmovielist);
  }

  final List<HotAndNewData> _trendingTvlist;
  @override
  List<HotAndNewData> get trendingTvlist {
    if (_trendingTvlist is EqualUnmodifiableListView) return _trendingTvlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingTvlist);
  }

  @override
  final bool isloading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'HomeState(stateid: $stateid, pastyearmovielist: $pastyearmovielist, trendingmovielist: $trendingmovielist, tensedramemovielist: $tensedramemovielist, southIndianmovielist: $southIndianmovielist, trendingTvlist: $trendingTvlist, isloading: $isloading, hasError: $hasError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.stateid, stateid) || other.stateid == stateid) &&
            const DeepCollectionEquality()
                .equals(other._pastyearmovielist, _pastyearmovielist) &&
            const DeepCollectionEquality()
                .equals(other._trendingmovielist, _trendingmovielist) &&
            const DeepCollectionEquality()
                .equals(other._tensedramemovielist, _tensedramemovielist) &&
            const DeepCollectionEquality()
                .equals(other._southIndianmovielist, _southIndianmovielist) &&
            const DeepCollectionEquality()
                .equals(other._trendingTvlist, _trendingTvlist) &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateid,
      const DeepCollectionEquality().hash(_pastyearmovielist),
      const DeepCollectionEquality().hash(_trendingmovielist),
      const DeepCollectionEquality().hash(_tensedramemovielist),
      const DeepCollectionEquality().hash(_southIndianmovielist),
      const DeepCollectionEquality().hash(_trendingTvlist),
      isloading,
      hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final String stateid,
      required final List<HotAndNewData> pastyearmovielist,
      required final List<HotAndNewData> trendingmovielist,
      required final List<HotAndNewData> tensedramemovielist,
      required final List<HotAndNewData> southIndianmovielist,
      required final List<HotAndNewData> trendingTvlist,
      required final bool isloading,
      required final bool hasError}) = _$_HomeState;

  @override
  String get stateid;
  @override
  List<HotAndNewData> get pastyearmovielist;
  @override
  List<HotAndNewData> get trendingmovielist;
  @override
  List<HotAndNewData> get tensedramemovielist;
  @override
  List<HotAndNewData> get southIndianmovielist;
  @override
  List<HotAndNewData> get trendingTvlist;
  @override
  bool get isloading;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
