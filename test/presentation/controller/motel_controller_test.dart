import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/domain/entities/response/response_list.dart';
import 'package:guia_moteis/presentation/screens/motels/controller/motel_controller.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:guia_moteis/domain/usecase/get_motels.dart';

import 'package:guia_moteis/infra/failure/failure.dart';
import 'package:mockito/annotations.dart';

import '../../fixture/fixture.dart';
import 'motel_controller_test.mocks.dart';

@GenerateMocks([GetMotelsUseCase])
void main() {
  late MotelController controller;
  late GetMotelsUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetMotelsUseCase();
    controller = MotelController(getMotelsUseCase: mockUseCase);
  });

  group("MotelController", () {
    test("Should get motels and update status", () async {
      when(mockUseCase.call()).thenAnswer(
        (_) async => Right(ResponseList(
            sucess: true, pageInfo: testPageInfo, data: testMotels)),
      );

      expect(controller.state, isA<IdleMotelState>());

      await controller.list();

      expect(controller.state, isA<IdleMotelState>());
      expect(controller.filteredMotels.length, 2);
      expect(controller.pageInfo.totalItens, 2);
      verify(mockUseCase.call()).called(1);
    });

    test("Should give an error when trying to load motels", () async {
      when(mockUseCase.call()).thenAnswer(
        (_) async => Left(ServerFailure(msg: "Erro ao carregar")),
      );

      await controller.list();

      expect(controller.state, isA<ErrorMotelState>());
      expect((controller.state as ErrorMotelState).msg, "Erro ao carregar");
    });

    test("Should enable/disable a filter", () {
      expect(controller.filterItensList[0].isSelected, false);

      controller.toggleFilter("piscina");

      expect(
          controller.filterItensList
              .firstWhere((f) => f.name == "piscina")
              .isSelected,
          true);

      controller.toggleFilter("piscina");

      expect(
          controller.filterItensList
              .firstWhere((f) => f.name == "piscina")
              .isSelected,
          false);
    });

    test("Should reset the filters", () {
      controller.filterItensList[0].isSelected = true;
      controller.filterItensList[1].isSelected = true;

      controller.resetFilters();

      for (var filter in controller.filterItensList) {
        expect(filter.isSelected, false);
      }
    });
  });
}
