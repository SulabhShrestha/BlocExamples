class MyAppModel {
  final bool showLoading;
  final bool enabledButton;

  MyAppModel({
    this.showLoading = false,
    this.enabledButton = false,
  });


  MyAppModel copyWith({
    bool? showLoading, 
    bool? enabledButton,
  }){
    return MyAppModel(
      showLoading: showLoading ?? this.showLoading,
      enabledButton: enabledButton ?? this.enabledButton,
    );
  }

}
