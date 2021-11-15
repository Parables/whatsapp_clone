import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/camera_page.dart';
import 'package:whatsapp_clone/widgets/chat_counter.dart';
import 'package:whatsapp_clone/widgets/list_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(WhatsappClone(
    camera: firstCamera,
  ));
}

class WhatsappClone extends StatefulWidget {
  const WhatsappClone({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;

  @override
  State<WhatsappClone> createState() => _WhatsappCloneState();
}

class _WhatsappCloneState extends State<WhatsappClone> {
  int currentIndex = 1;
  @override
  build(context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Builder(builder: (context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            setState(() {
              currentIndex = tabController.index;
            });
          }
        });
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal,
            ),
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text("WhatsApp"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
              ],
              bottom: TabBar(
                controller: tabController,
                indicatorColor: Colors.white,
                tabs: [
                  const Tab(icon: Icon(Icons.camera_alt)),
                  Tab(
                      child: Row(
                    children: const [
                      Text("CHATS"),
                      SizedBox(width: 5),
                      ChatCounter(
                        count: 5,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.teal,
                        width: 15,
                        height: 15,
                      ),
                    ],
                  )),
                  const Tab(text: "STATUS"),
                  const Tab(text: "CALLS"),
                ],
              ),
            ),
            body: TabBarView(controller: tabController, children: [
              CameraPage(camera: widget.camera),
              const ListPage(
                pageName: "Chats",
              ),
              const ListPage(
                pageName: "Status",
              ),
              const ListPage(
                pageName: "Calls",
              ),
            ]),
            floatingActionButton: Visibility(
              visible: currentIndex != 0,
              child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    currentIndex == 1
                        ? Icons.message
                        : currentIndex == 2
                            ? Icons.camera_alt
                            : Icons.add_ic_call,
                  )),
            ),
          ),
        );
      }),
    );
  }

  setIndex(int index) {}
}
