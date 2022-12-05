import 'package:clean_architecture_flutter/features/recommend/presentation/pages/signin_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/user/user_info.dart';
import '../../../../injection_container.dart';

import '../widgets/menu_card_widget.dart';
import 'menu_way_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserInfo userInfo = sl();

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(width: 500, height: 500),
          child: Column(
            children: [
              Text(
                '안녕하세요 ${userInfo.id}님.',
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
                          builder: (context) => const MenuWayPage()),
                    );
                  },
                  image: const AssetImage('assets/build_computer.jpg'),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '컴퓨터 부품 조합 맞춰보기',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '${userInfo.id}님이 선호하는 구성에 맞춰 컴퓨터 부품을 추천합니다.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
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
                  image: const AssetImage('assets/usage_history.jpg'),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이전 사용내역 확인하기',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '${userInfo.id}님께 추천해드렸던 견적을 다시 확인합니다.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
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
