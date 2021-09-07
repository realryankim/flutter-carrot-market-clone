import 'package:carrot_market_clone/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  Widget _bodyWidget() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        itemBuilder: (BuildContext _context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    'assets/images/ara-1.jpg',
                    width: 100,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0),
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '운동화',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '500',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/heart_off.svg',
                                  width: 13,
                                  height: 13,
                                ),
                                SizedBox(width: 5.0),
                                Text('20'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext _context, int index) {
          return Container(height: 1, color: Colors.black.withOpacity(0.4));
        },
        itemCount: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            print('다른 지역');
          },
          child: PopupMenuButton<String>(
            offset: Offset(0, 35),
            shape: ShapeBorder.lerp(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((10.0))),
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((10.0))),
                1),
            onSelected: (String where) {
              controller.changeLocation(where);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: 'ara', child: Text('아라동')),
                PopupMenuItem(value: 'ora', child: Text('오라동')),
                PopupMenuItem(
                    value: 'setting_neighborhood', child: Text('내 동네 설정하기')),
              ];
            },
            child: Obx(
              () => Row(
                children: [
                  Text(controller.locationTypeToString[
                      controller.currentLocation!.value]!),
                  Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
          ),
        ),
        elevation: 1.0,
        actions: [
          IconButton(
            onPressed: () {
              print('상품 검색');
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print('카테고리');
            },
            icon: Icon(Icons.tune),
          ),
          IconButton(
            onPressed: () {
              print('알림');
            },
            icon: SvgPicture.asset(
              'assets/svg/bell.svg',
              width: 22,
            ),
          ),
        ],
      ),
      body: _bodyWidget(),
    );
  }
}
