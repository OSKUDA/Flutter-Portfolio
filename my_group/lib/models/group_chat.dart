class GroupChat {
  List<dynamic> _memberList = [];
  String _groupChatId = '';
  int _groupChatNumber = 0;
  String _owner = '';
  String _title = '';
  GroupChat(
      {required String groupChatId,
      required int groupChatNumber,
      required String title,
      required String owner,
      required List<dynamic> memberList}) {
    _groupChatId = groupChatId;
    _groupChatNumber = groupChatNumber;
    _title = title;
    _owner = owner;
    _memberList = memberList;
  }

  //getters
  List<dynamic> get getMemberList => _memberList;
  String get getGroupChatId => _groupChatId;
  int get getGroupChatNumber => _groupChatNumber;
  String get getOwner => _owner;
  String get getTitle => _title;
}
