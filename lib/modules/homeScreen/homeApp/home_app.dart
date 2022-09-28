import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/modules/homeScreen/homeApp/cubit/cubit.dart';
import 'package:shopping/shared/components/components.dart';
import '../../../shared/styles/style.dart';
import 'cubit/states.dart';

class HommApp extends StatelessWidget {
  const HommApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeAppCubit();
      },
      child: BlocConsumer<HomeAppCubit, HomeAppstates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeAppCubit.get(context);
            cubit.getHomeModel();
      
            return ConditionalBuilder(
                          builder: (BuildContext context) { return
                            SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),

                   
                    CarouselSlider(
                      items: cubit.homeModel.data.banners
                          .map((e) => Image(
                                image: NetworkImage('${e.image}'),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ))
                          .toList(),
                      options: CarouselOptions(
                        height: 200,
                        initialPage: 0,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Catalogue",
                          style: style6,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...HomeAppCubit.get(context).photos.map((e) {
                              return Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(e),
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: () {},
                                        child: Center(
                                            child: Text(
                                          cubit.txt[e.indexOf(e)],
                                          style: style3,
                                        ))),
                                  ),
                                ),
                              ]);
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Text(
                        "Featured",
                        style: style6,
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 1.5,
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                          cubit.photos.length,
                          (index) => productWidget(cubit.photos[index],
                              cubit.icon, cubit.ratingvalue, "product name", 10)),
                    )
                  ]),
                ),
              ); }, condition: cubit.datacome,
               fallback: (BuildContext context) { return Center(child: CircularProgressIndicator()); },
                         
            );
          }),
    );
  }
}
