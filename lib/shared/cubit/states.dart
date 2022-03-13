abstract class NewsAppStates {}

class InitialState extends NewsAppStates {}

class ChangeBottomNavigationBar extends NewsAppStates {}

class NewsBusinessGetSuccessState extends NewsAppStates {}
class NewsBusinessGetErrorState extends NewsAppStates {
  final String error;

  NewsBusinessGetErrorState(this.error);
}
class NewsBusinessGetLoadingState extends NewsAppStates {}

class NewsScienceGetSuccessState extends NewsAppStates {}
class NewsScienceGetErrorState extends NewsAppStates {
  final String error;

  NewsScienceGetErrorState(this.error);
}
class NewsScienceGetLoadingState extends NewsAppStates {}

class NewsSportGetSuccessState extends NewsAppStates {}
class NewsSportGetErrorState extends NewsAppStates {
  final String error;

  NewsSportGetErrorState(this.error);
}
class NewsSportGetLoadingState extends NewsAppStates {}

class NewsSearchGetSuccessState extends NewsAppStates {}
class NewsSearchGetErrorState extends NewsAppStates {
  final String error;

  NewsSearchGetErrorState(this.error);

}
class NewsSearchGetLoadingState extends NewsAppStates {}

