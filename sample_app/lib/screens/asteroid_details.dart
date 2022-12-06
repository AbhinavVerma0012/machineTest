import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/models/LookUp.dart';
import 'package:sample_app/providers/astroid_provider.dart';

final asteroidIdProvider = StateProvider.autoDispose((_)=> "");

class AsteroidDetails extends HookConsumerWidget {
  const AsteroidDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final astId = ref.watch(asteroidIdProvider);
    final detailsFuture = ref.watch(asteroidsProvider.notifier).getAsteroidDetails(astId);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Asteroid Details"),
      ),

      body: FutureBuilder(
        future: detailsFuture,
        builder: (BuildContext context, AsyncSnapshot<AsteroidLookUp> snapshot) { 

          if(snapshot.hasData){
            final details = snapshot.data;
            final lastData = details!.closeApproachData!.last;

            return Column(
              children: [
                Text(details.name ??""),
                Text(details.designation ??""),
                Text(lastData.closeApproachDate.toString())
              ],
            );
          }else{
            return const Text("Loading....");
          }

         },
      )
    );
  }
}