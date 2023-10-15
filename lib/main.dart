import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApphome(),
    );
  }
}

class MyApphome extends StatefulWidget {
  const MyApphome({super.key});

  @override
  State<MyApphome> createState() => _MyApphomeState();
}

class _MyApphomeState extends State<MyApphome> {
  int selected = 1;

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.search_sharp,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Stack(
            children: [
              SizedBox(
                height: 250,
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Image.network(
                        "https://www.hollywoodreporter.com/wp-content/uploads/2023/07/source-6033-H-2023.jpg?w=1296",
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: 250,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    icon: _controller.value.isPlaying
                        ? const Icon(
                            Icons.pause,
                            color: Colors.transparent,
                            size: 80,
                          )
                        : const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 50,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 2.0,
                      percent: 0.2,
                      backgroundColor: Colors.red.shade100,
                      progressColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Rick and Morty",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "2022",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.font_download,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "6 Seasons",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.message_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "New episode coming on Monday",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Play",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Download S1:E1",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "This animated sci-fi series co-created by Dan Harmon and Justhin Roiland features Chris Parnell and Sarah Chalke.",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Starring:",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Justhin Roiland,Chris Parnell...",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "more",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Creators:",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Dan Harmon,Justhin Roiland",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "My List",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.thumb_up_off_alt_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rate",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Share",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.download,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Download",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.white12,
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 5,
                          width: 100,
                          color:
                              selected == 1 ? Colors.red : Colors.transparent,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 1;
                            });
                          },
                          child: Text(
                            "Episodes",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 5,
                          width: 140,
                          color:
                              selected == 2 ? Colors.red : Colors.transparent,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 2;
                            });
                          },
                          child: Text(
                            "More Like This",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                selected == 1
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Season 1",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 80,
                                    width: 150,
                                    child: Center(
                                      child: Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1. Pilot",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "22m",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  const Icon(
                                    Icons.download,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rick, an alcoholic sociopath and scientist, lives with his daughter Beth's family. Apart from building gadgets, he takes his morally right but dimwit grandson Morty on absurd intergalactic adventures.",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 80,
                                    width: 150,
                                    child: Center(
                                      child: Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "2. Dog",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "22m",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  const Icon(
                                    Icons.download,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rick, an alcoholic sociopath and scientist, lives with his daughter Beth's family. Apart from building gadgets, he takes his morally right but dimwit grandson Morty on absurd intergalactic adventures.",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 80,
                                    width: 150,
                                    child: Center(
                                      child: Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "3. Park",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "22m",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  const Icon(
                                    Icons.download,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rick, an alcoholic sociopath and scientist, lives with his daughter Beth's family. Apart from building gadgets, he takes his morally right but dimwit grandson Morty on absurd intergalactic adventures.",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              movietile(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA"),
                              movietile(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA"),
                              movietile(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA"),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              movietile(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA"),
                              movietile(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA"),
                              movietile(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA"),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              movietile(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA"),
                              movietile(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA"),
                              movietile(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxwpSzqoAi0kj2OdiCWk90uGZPSU_D0I3aA"),
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

Widget movietile(String img) {
  return Container(
    height: 150,
    width: 110,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        img,
        fit: BoxFit.cover,
      ),
    ),
  );
}
