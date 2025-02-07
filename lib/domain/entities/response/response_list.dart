class ResponseList<T> {
  final bool sucess;
  final PageInfoResponse pageInfo;
  final List<T> data;

  ResponseList(
      {required this.sucess, required this.pageInfo, required this.data});
}

class PageInfoResponse {
  final int quantityItens;
  final int totalItens;
  final int maxPageItens;

  PageInfoResponse(
      {required this.quantityItens,
      required this.totalItens,
      required this.maxPageItens});
}
