import 'dart:convert';
import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/features/recommend/data/datasources/recommend_remote_data_source.dart';
import 'package:clean_architecture_flutter/features/recommend/data/models/computer_item_model.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_item.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item.dart';
import 'package:clean_architecture_flutter/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';
@GenerateNiceMocks([MockSpec<http.Client>(), MockSpec<GetComputerCPU>()])
import 'recommend_remote_data_source_test.mocks.dart';

void main() {
  late MockClient mockClient;
  late RecommendRemoteDataSourceImpl dataSource;

  setUp(() {
    mockClient = MockClient();
    dataSource = RecommendRemoteDataSourceImpl(client: MockClient());
  });

  void setUpMockHttpClientSuccess200() {
    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('cpu.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  test(
    'should ',
    () async {
      // arrange
      const tCPUId = 16101353;
      when(mockClient
              .get(Uri.parse('http://175.196.11.206:8080/cpu/model/$tCPUId')))
          .thenAnswer((_) async => http.Response(fixture('cpu.json'), 200));
      // act
      MockGetComputerCPU getComputerCPU = MockGetComputerCPU();
      // assert
      expect(await getComputerCPU(tCPUId), isA<Either<Failure, ComputerCPU>>());
    },
  );

  // group('getComputerItem', () {
  //   const tCPUId = 16101353;
  //   final tCPUModel =
  //       ComputerCPUModel.fromJson(jsonDecode(fixture('cpu.json')));

  //   test(
  //     '''cpu item''',
  //     () async {
  //       // arrange
  //       setUpMockHttpClientSuccess200();
  //       // act
  //       dataSource.getComputerCPU(tCPUId);
  //       // assert
  //       verify(mockClient.get(
  //         Uri.parse('http://175.196.11.206:8080/cpu/model/$tCPUId'),
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //       ));
  //     },
  //   );
  // });
}
