import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref){
  return "Hello Venu";
});

class Riverpodpractice extends StatelessWidget {
  const Riverpodpractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPOD"),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child)
          {
            final name = ref.watch(nameProvider);
            return Text(name);
          },),
      ),
    );
  }
}


//
// class Riverpodpractice extends ConsumerWidget {
//   const Riverpodpractice({super.key});
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     final name = ref.watch(nameProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Riverpod"),
//       ),
//       body: Center(
//           child: Text(name)
//       ),
//     );
//
//   }
// }
//

//
// class RiverpodLearning extends ConsumerStatefulWidget {
//    RiverpodLearning({super.key});
//
//   @override
//   ConsumerState<RiverpodLearning> createState() => _RiverpodLearningState();
// }
//
// class _RiverpodLearningState extends ConsumerState<RiverpodLearning> {
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//
//     final name = ref.watch(nameProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Riverpod'),
//       ),
//       body: Center(name),
//     );
//
//   }
// }
