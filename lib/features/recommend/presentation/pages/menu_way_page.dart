import 'package:flutter/material.dart';

import '../widgets/menu_card_widget.dart';
import 'recommend_page.dart';

class MenuWayPage extends StatelessWidget {
  const MenuWayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(width: 500, height: 500),
          child: Column(
            children: [
              Text(
                '추천 방법을 선택하세요.',
                style: Theme.of(context).textTheme.headline3,
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 4,
                child: MenuCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecommendPage(
                          title: '금액과 제조사로 추천',
                          cost: true,
                          manufacturer: true,
                        ),
                      ),
                    );
                  },
                  image: const AssetImage('assets/money.jpg'),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '금액과 제조사로 추천',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 4,
                child: MenuCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecommendPage(
                          title: '사용할 프로그램으로 추천',
                          program: true,
                        ),
                      ),
                    );
                  },
                  image: const AssetImage('assets/apps.jpg'),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '사용할 프로그램으로 추천',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
