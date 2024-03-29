import 'package:auto_route/auto_route.dart';
import 'package:chopper_crew_app/models/news_model.dart';
import 'package:chopper_crew_app/repository/news_repository.dart';
import 'package:chopper_crew_app/router/router.dart';
import 'package:chopper_crew_app/theme/colors.dart';
import 'package:flutter/material.dart';


@RoutePage()
class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'News',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: newsRepository.length,
                    separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 15),
                    itemBuilder: (BuildContext context, int index) {
                      final NewsModel _news = newsRepository[index];
                      return GestureDetector(
                        onTap: () {
                          context.router.push(NewsInfoRoute(news: _news));
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              child: Image.asset(
                                _news.image,
                                fit: BoxFit.cover,
                                height: 200,
                                width: double.infinity,
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_news.title, style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(_news.date, style: TextStyle(
                                    color: AppColors.black40,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}