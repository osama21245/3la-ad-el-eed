import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class PickImageState extends Equatable {}

class PickImageInitial extends PickImageState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class PickImageLoading extends PickImageState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class PickImageSuccess extends PickImageState {
  final File file;
  PickImageSuccess(this.file);

  @override
  List<Object?> get props => [file];
}

class PickImageFailure extends PickImageState {
  final String errMessage;
  PickImageFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
