abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsBusinessSuccessState extends NewsStates{}
class NewsBusinessErorState extends NewsStates{
  String? Eror;
  NewsBusinessErorState(this.Eror);
}
class NewsLodingState extends NewsStates{}