import 'package:flutter/material.dart';
import 'package:projectapp/models/level.dart';
import 'package:projectapp/models/materi.dart';
import 'package:projectapp/widget/dialog_question_on_close.dart';
import 'package:video_player/video_player.dart';

class MateriLevelPage extends StatefulWidget {
  const MateriLevelPage({
    Key? key,
    required this.level,
    required this.materi,
  }) : super(key: key);

  final Materi materi;
  final Level level;

  @override
  State<MateriLevelPage> createState() => _MateriLevelPageState();
}

class _MateriLevelPageState extends State<MateriLevelPage> {
  VideoPlayerController? _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    final videoUrl = await widget.level.fetchVideoUrl();
    if (videoUrl != null) {
      _controller = VideoPlayerController.network(videoUrl);
      _initializeVideoPlayerFuture = _controller!.initialize();
      _controller?.setLooping(true);
      _controller?.setVolume(1.0);
      _controller?.addListener(() {
        setState(() {});
      });
    } else {
      // Handle error jika gagal memuat URL video
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.colorScheme.primary,
          ),
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return DialogQuestionOnClose(
                  materi: widget.materi,
                );
              },
            );
          },
        ),
        title: Text('Level ${widget.level.number}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          SizedBox( height: 30,),
          Container(
            child: _controller != null && _controller!.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
          )
        ]),
      ),
    );
  }
}
