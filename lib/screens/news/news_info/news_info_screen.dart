import 'package:auto_route/auto_route.dart';
import 'package:chopper_crew_app/models/news_model.dart';
import 'package:chopper_crew_app/theme/colors.dart';
import 'package:flutter/material.dart';


@RoutePage()
class NewsInfoScreen extends StatefulWidget {
  final NewsModel news;
  const NewsInfoScreen({super.key, required this.news});

  @override
  State<NewsInfoScreen> createState() => _NewsInfoScreenState();
}

class _NewsInfoScreenState extends State<NewsInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leadingWidth: 110,
        leading: GestureDetector(
          onTap: () {
            context.router.pop();
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_new, color: AppColors.orange),
              SizedBox(width: 5),
              Text(
                'Back',
                style: TextStyle(
                  color: AppColors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        title: Text(
          'News',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(
                    widget.news.image,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  widget.news.title,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(widget.news.date, style: TextStyle(
                  color: AppColors.black40,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                ),
                SizedBox(height: 15),
                Text(
                  widget.news.article,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );  }
}