import 'package:clean_architecture_flutter/core/utility/state_widget.dart';
import 'package:flutter/cupertino.dart';

import '../error/failures.dart';

class FutureWidget<T> extends StatelessWidget {
  const FutureWidget(
      {required this.data,
      required this.display,
      required this.error,
      required this.loading,
      super.key});
  final Future<T> data;
  final Widget Function(T) display;
  final Widget error;
  final Widget loading;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return display(snapshot.requireData);
        } else if (snapshot.hasError) {
          return FailedWidget(
              message: (snapshot.error as Failure).message, child: error);
        }
        return loading;
      },
    );
  }
}
// class FutureWidget<T> extends StatelessWidget {
//   const FutureWidget({this.data, this.hasData, this.hasDataFunc, this.hasError, this.hasErrorFunc, super.key});
//   final Future<T>? data;
//   final Widget? hasData;
//   final Widget Function(T)? hasDataFunc;
//   final Widget? hasError;
//   final Widget Function(Object?)? hasErrorFunc;

//   @override
//   Widget build(BuildContext context) {
//     assert(hasData == null || hasDataFunc == null);
//     assert(hasError == null || hasErrorFunc == null);
//     return FutureBuilder(future: data, builder: ((context, snapshot) {
//       if (snapshot.hasData) {
//         if (hasData != null) {
//           return hasData!;
//         }
//         if (hasDataFunc != null) {
//           return hasDataFunc!(snapshot.requireData);
//         }
//         return const SizedBox.shrink();
//       } else if (snapshot.hasError) {
//         if (hasError != null) {
//           return hasError!;
//         }
//         if (hasErrorFunc != null) {
//           return hasErrorFunc!(snapshot.error);
//         }
//         return FailedWidget(
//               message: (snapshot.error as Failure).message,
//               child: const ComputerItemDisplay2Loading(play: false));
//         }
//       }
//       return const ComputerItemDisplay2Loading();
//     }))
//   }
// }