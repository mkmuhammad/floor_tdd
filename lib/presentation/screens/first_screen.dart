import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/first_screen_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Floor with Clean Architecture')),
      body: Center(
        child: BlocBuilder<FirstScreenBloc, FirstScreenState>(
          builder: (context, state) {
            final controller = context.read<FirstScreenBloc>().textEditingController;
            final bloc = context.read<FirstScreenBloc>();
            return Column(
              children: [
                const SizedBox(height: 16.0),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: (state as FirstScreenInitial).persons?.length ?? 0,
                    itemBuilder: (context, index) {
                      final person = state.persons?[index];
                      if (person != null) {
                        return Center(child: Text('Person Record | id = ${person.id ?? -1} | name = ${person.name}'));
                      }
                      return const SizedBox();
                    }),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextField(
                    decoration: const InputDecoration(fillColor: Colors.grey, filled: true, hintText: 'add person name'),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    controller: controller,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    bloc.add(AddPersonEvent(controller.text));
                    bloc.add(GetAllPersonsEvent());
                  },
                  child: const Text('Add Person'),
                ),
                ElevatedButton(
                  onPressed: () {
                    bloc.add(GetAllPersonsEvent());
                  },
                  child: const Text('Get All Person'),
                ),
                ElevatedButton(
                  onPressed: () {
                    bloc.add(DeleteAllPersonsEvent());
                  },
                  child: const Text('Delete All'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
