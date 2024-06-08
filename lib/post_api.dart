import 'package:flutter/material.dart';
import 'api_controller.dart';

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  TextEditingController jobController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  List createUser = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post Api", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              itemCount: createUser.length,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(15),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 230,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(color: Colors.blueAccent.shade100, borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            const Text("User Name = ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(createUser[index]["name"]),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            const Text("User Role = ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(" ${createUser[index]["job"]} "),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            const Text("User Id = ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(" ${createUser[index]["id"]} "),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Jobs"),
                actions: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                  TextFormField(
                    controller: jobController,
                    decoration: const InputDecoration(
                      hintText: "Job",
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () async {
                            var data = await ApiController().userData(job: jobController.text, name: nameController.text, context: context);
                            print("--data $data");
                            createUser.add(data);
                            setState(() {});
                            debugPrint("-----List Data--->>$createUser");
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                            nameController.clear();
                            jobController.clear();
                            setState(() {});
                          },
                          child: const Text("Submit")),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("cancel")),
                    ],
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
