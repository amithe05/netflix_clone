import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/Videowidget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(month),
              Text(
                day,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(url: posterPath,),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          letterSpacing: -3),
                    ),
                  ),
              
                
                    
                     const CustomButton(
                        title: 'Remind me',
                        icon: Icons.notifications,
                        iconsize: 20,
                        textsize: 12,
                      ),
                      kwidth,
                    const  CustomButton(
                        title: 'info',
                        icon: Icons.info,
                        iconsize: 20,
                        textsize: 12,
                      ),
                      kwidth
                  
                  
                ],
              ),
            
              Text('coming on $day $month'),
              kheight,
              Text(
                movieName,
                maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              kheight,
              Text(description,
              maxLines: 4,
              overflow:TextOverflow.ellipsis,
                style:const TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
