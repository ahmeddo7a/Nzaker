class ScreenArguments<T>{
  final T data;
  const ScreenArguments({required this.data});
}
class CustomDownloadsScreenArguments<T,String>{
  final T data;
  final String name;
  const CustomDownloadsScreenArguments({required this.data,required this.name});
}