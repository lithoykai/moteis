import 'package:flutter/material.dart';
import 'package:guia_moteis/domain/entities/motel/motel.dart';
import 'package:guia_moteis/domain/entities/response/response_list.dart';
import 'package:guia_moteis/domain/usecase/get_motels.dart';
import 'package:guia_moteis/infra/const/filter_mapper.dart';
import 'package:injectable/injectable.dart';

@singleton
class MotelController extends ChangeNotifier {
  final GetMotelsUseCase _getMotelsUseCase;

  MotelController({required GetMotelsUseCase getMotelsUseCase})
      : _getMotelsUseCase = getMotelsUseCase;

  PageInfoResponse pageInfo =
      PageInfoResponse(totalItens: 0, maxPageItens: 0, quantityItens: 0);

  List<Motel> _motels = [];
  List<Motel> get motels => [..._motels];
  List<Motel> filteredMotels = [];
  MotelState state = IdleMotelState();
  List<FilterItens> filterItensList = [...filterItens];

  void resetFilters() {
    for (var filter in filterItensList) {
      filter.isSelected = false;
    }
    notifyListeners();
  }

  void toggleFilter(String name) {
    final filter = filterItensList.firstWhere((item) => item.name == name);
    filter.toggleStatus();
    filterMotels();
  }

  void filterMotels() {
    final activeFilters = filterItensList
        .where((filter) => filter.isSelected)
        .map((filter) => filter.name.toLowerCase())
        .toList();

    if (activeFilters.isEmpty) {
      filteredMotels = _motels;
    } else {
      filteredMotels = _motels.where((motel) {
        bool matchesFilters = true;

        //filtragem dos "especiais"
        if (activeFilters.contains("disponíveis")) {
          matchesFilters &= motel.suites.any((suite) => suite.quantity > 0);
        }
        if (activeFilters.contains("com desconto")) {
          matchesFilters &= motel.suites.any((suite) =>
              suite.periods.any((periodo) => periodo.promotion != null));
        }

        if (activeFilters.any(
            (filter) => filter != "disponíveis" && filter != "com desconto")) {
          matchesFilters &= motel.suites.any((suite) {
            final matchesCategory = suite.categoryItens.any(
              (category) => activeFilters.contains(category.name.toLowerCase()),
            );
            final matchesItem = suite.itens.any(
              (item) => activeFilters.contains(item.name.toLowerCase()),
            );
            return matchesCategory || matchesItem;
          });
        }

        return matchesFilters;
      }).toList();
    }

    notifyListeners();
  }

  void _setMotels(List<Motel> list) {
    _motels = List.of(list);
    filteredMotels = List.of(list);
    notifyListeners();
  }

  void _setPageInfo(PageInfoResponse value) {
    pageInfo = value;
    notifyListeners();
  }

  Future<void> list() async {
    state = LoadingMotelState();
    resetFilters();
    notifyListeners();

    final _response = await _getMotelsUseCase.call();

    _response.fold(
      (error) {
        state = ErrorMotelState(error.toString());
        notifyListeners();
      },
      (data) {
        _setPageInfo(data.pageInfo);
        _setMotels(data.data);
        state = IdleMotelState();
        notifyListeners();
      },
    );
  }
}

abstract class MotelState {}

class LoadingMotelState extends MotelState {}

class IdleMotelState extends MotelState {}

class ErrorMotelState extends MotelState {
  final msg;
  ErrorMotelState(this.msg);

  @override
  String toString() => msg;
}
