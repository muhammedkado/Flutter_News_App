abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsBusinessSuccessState extends NewsStates{}
class NewsBusinessErorState extends NewsStates{
  String? Eror;
  NewsBusinessErorState(this.Eror);
}
class NewsGetBusinessLoadingState extends NewsStates{}

class NewsSportsSuccessState extends NewsStates{}
class NewsSportsErorState extends NewsStates{
  String? Eror;
  NewsSportsErorState(this.Eror);
}
class NewsSportsLoadingState extends NewsStates{}

class NewsScienceSuccessState extends NewsStates{}
class NewsScienceErorState extends NewsStates{
  String? Eror;
  NewsScienceErorState(this.Eror);
}
class NewsScienceLoadingState extends NewsStates{}

class NewsHealthSuccessState extends NewsStates{}
class NewsHealthErorState extends NewsStates{
  String? Eror;
  NewsHealthErorState(this.Eror);
}
class NewsHealthLoadingState extends NewsStates{}


class NewsSearchSuccessState extends NewsStates{}
class NewsSearchErorState extends NewsStates{
  String? Eror;
  NewsSearchErorState(this.Eror);
}
class NewsSearchLoadingState extends NewsStates{}


class NewsAppModeState extends NewsStates{}