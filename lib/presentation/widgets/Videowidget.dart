import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.wifi),
              );
            },
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_off),
            ),
          ),
        ),
      ],
    );
  }
}
