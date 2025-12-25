part of 'favourite_cubit.dart';

class FavouriteState extends Equatable {
  final BaseState<List<DataEntity>> favourites;

  const FavouriteState({
    this.favourites = const BaseState<List<DataEntity>>(),
  });

  factory FavouriteState.initial() {
    return const FavouriteState(
      favourites: BaseState<List<DataEntity>>(),
    );
  }

  FavouriteState copyWith({
    BaseState<List<DataEntity>>? favourites,
  }) {
    return FavouriteState(
      favourites: favourites ?? this.favourites,
    );
  }

  @override
  List<Object?> get props => [favourites];
}
