import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/modules/homeScreen/homeApp/cubit/cubit.dart';
import 'package:shopping/modules/homeScreen/homeApp/search_screen.dart';
import 'package:shopping/shared/cubit/cubit.dart';
import 'package:shopping/shared/cubit/states.dart';
import 'package:shopping/shared/network/remote/bloc_obsever.dart';
import '../shared/components/components.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return HomeCubit();
      },
      child: BlocConsumer<HomeCubit, Homestates>(listener: (context, state) {
        // ignore: avoid_print
        if (state is HomeInitState) {
          print("init state ");
        }
        // ignore: avoid_print
        if (state is HomeCurrentState) {
          print("current state ");
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: txtrow("MY", "SHOP", 20),
            actions: const [Icon(Icons.notifications)],
            leading: const Icon(Icons.menu),
            backgroundColor: Colors.deepPurple,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    color: Colors.deepPurple,
                    width: double.infinity,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: SizedBox(
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          // textAlignVertical: TextAlignVertical.center,

                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                            hintText: "what do you want?",
                          ),
                          onFieldSubmitted: (value) {
                            navigator(context, const Search());
                          },
                        ),
                      ),
                    ),
                  ),
                ]),
                ConditionalBuilder(
                  condition: true,
                  builder: (context) => HomeCubit.get(context)
                      .screens[HomeCubit.get(context).index],
                  fallback: (context) =>
                      const Center(child: Text('this is not true')),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey[400],
              currentIndex: HomeCubit.get(context).index,
              onTap: (index) {
                HomeCubit.get(context).changeindex(index);
              
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: "Category"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorite"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ]),
        );
      }),
    );
  }
}
