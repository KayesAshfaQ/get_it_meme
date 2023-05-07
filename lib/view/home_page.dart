import 'package:flutter/material.dart';
import 'package:get_it_meme/domain/models/meme_element.dart';

import '../domain/meme_controller.dart';
import '../domain/models/meme.dart';
import '../locator.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  List<MemeElement> memes = [];
  int memeCount = 0;
  int memeMaxCount = 0;

  @override
  void initState() {
    print('initState called');
    callApi();
    super.initState();
  }

  void callApi() async {
    print('callApi called');
    // TODO 5:  call the domain controller to get meme
    Meme? meme = await locator.get<MemeDomainController>().getNextMeme();

    if (meme != null && meme.memes!.isNotEmpty) {
      setState(() {
        memes = meme.memes!;
        memeMaxCount = meme.count!;
      });

      print('meme count: ${meme.count}');
      print('meme list length: ${memes.length}');
    }
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Get-It Meme'),
      ),
      body: Container(
        child: memes.isNotEmpty
            ? Padding(
          padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subreddit: ${memes[memeCount].subreddit}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Author: ${memes[memeCount].author}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),const SizedBox(height: 8),
                  Text(
                    'Title: ${memes[memeCount].title}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: height * 0.7,
                      ),
                      //height: height * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: memes[memeCount].url != null
                          ? Image.network(
                              memes[memeCount].url ?? '',
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            )
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
            )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO 7: Use set state to update the visibleMeme
          memeCount++;
          if (memeCount >= memeMaxCount) {
            memeCount = 0;
          }
          setState(() {

          });
          print('next btn pressed');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.skip_next),
      ),
    );
  }
}
