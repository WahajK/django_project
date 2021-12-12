import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/models/shoes_brend.dart';
import 'package:untitled/models/worker_model.dart';
import 'package:untitled/screens/home_screen/components/grid_card.dart';
import 'package:untitled/screens/home_screen/logic/brand_name_string.dart';
import 'package:untitled/screens/home_screen/logic/get_list.dart';
import 'package:untitled/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ShoesBrand model = ShoesBrand.all;
  Worker_enum worker_model = Worker_enum.all;
  var currentCategory = 0;

  @override
  Widget build(BuildContext context) {
    List<Worker> workers = _getWorkers(category: worker_model);
    var list = getProductFor(model: model);

    return CustomScrollView(

      slivers:
      [
         const SliverAppBar(
           backgroundColor: Colors.blue,
           automaticallyImplyLeading: false,
          pinned: false,
          expandedHeight: 25,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('Shoes Shop'),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 80,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Worker_enum.values.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () async {
                    worker_model = Worker_enum.values[i];
                    setState(() {
                      currentCategory = i;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                      bottom: 20,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: currentCategory == i ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        CategoryName(Worker_enum.values[i]),
                        style: TextStyle(
                          color: currentCategory == i
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: .8,
            ),
            delegate: SliverChildBuilderDelegate(//WORKING HERE
              (ctx, i) {
                return GridCard(workers: workers[i]);
              },
              childCount: workers.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        )
      ],
    );
  }
}
List<Worker> _getWorkers({required Worker_enum category})
{
  List<Worker> filter_worker = [];
  
  if (category == Worker_enum.all) 
  {
    filter_worker = workers;
  } 
  else if (category == Worker_enum.engineer) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.engineer) {
        filter_worker.add(element);
      }
    }
  } 
  else if (category == Worker_enum.plumber) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.plumber) {
        filter_worker.add(element);
      }
    }
  } 
  else if (category == Worker_enum.doctor) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.doctor) {
        filter_worker.add(element);
      }
    }
  } 
  else if (category == Worker_enum.carpenter) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.carpenter) 
      {
        filter_worker.add(element);
      }
    }
  } 
  else if (category == Worker_enum.electrician) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.electrician) 
      {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.painter) {
    for (var element in workers) {
      if (element.category == Worker_enum.painter) 
      {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.barber) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.barber) {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.house_constructor) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.house_constructor) {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.mason) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.mason) {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.gardener) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.gardener) {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.cctv_installation) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.cctv_installation) {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.roofing_ceiling) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.roofing_ceiling) {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.welder) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.welder) {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.tailor) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.tailor) {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.ac_geyser_installation) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.ac_geyser_installation) {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.mobile_repair) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.mobile_repair) {
        filter_worker.add(element);
      }
    }
  }
  else if (category == Worker_enum.maid) 
  {
    for (var element in workers) {
      if (element.category == Worker_enum.maid) {
        filter_worker.add(element);
      }
    }
  }
return filter_worker;
}
