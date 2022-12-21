# computer_rec

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 메모

clean architecture에 따르면 datasource에서는 error객체를 throw하고 repository에서는 catch하여 failure객체를 반환하는 것이 맞지만,
구현상의 편리함을 위해 datasource에서부터 ServerException은 ServerFailure로 반환하였고 나머지 오류는 Exception객체로 throw된다.