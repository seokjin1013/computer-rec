import 'package:flutter/material.dart';

class TextThemeAllDisplay extends StatelessWidget {
  const TextThemeAllDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Text(
            'bodyLarge fontSize: ${Theme.of(context).textTheme.bodyLarge!.fontSize} color: ${Theme.of(context).textTheme.bodyLarge!.color}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'bodyMedium fontSize: ${Theme.of(context).textTheme.bodyMedium!.fontSize} color: ${Theme.of(context).textTheme.bodyMedium!.color}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'bodySmall fontSize: ${Theme.of(context).textTheme.bodySmall!.fontSize} color: ${Theme.of(context).textTheme.bodySmall!.color}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            'bodyText1 fontSize: ${Theme.of(context).textTheme.bodyText1!.fontSize} color: ${Theme.of(context).textTheme.bodyText1!.color}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'bodyText2 fontSize: ${Theme.of(context).textTheme.bodyText2!.fontSize} color: ${Theme.of(context).textTheme.bodyText2!.color}',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            'button fontSize: ${Theme.of(context).textTheme.button!.fontSize} color: ${Theme.of(context).textTheme.button!.color}',
            style: Theme.of(context).textTheme.button,
          ),
          Text(
            'caption fontSize: ${Theme.of(context).textTheme.caption!.fontSize} color: ${Theme.of(context).textTheme.caption!.color}',
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            'displayLarge fontSize: ${Theme.of(context).textTheme.displayLarge!.fontSize} color: ${Theme.of(context).textTheme.displayLarge!.color}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            'displayMedium fontSize: ${Theme.of(context).textTheme.displayMedium!.fontSize} color: ${Theme.of(context).textTheme.displayMedium!.color}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            'displaySmall fontSize: ${Theme.of(context).textTheme.displaySmall!.fontSize} color: ${Theme.of(context).textTheme.displaySmall!.color}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'headline1 fontSize: ${Theme.of(context).textTheme.headline1!.fontSize} color: ${Theme.of(context).textTheme.headline1!.color}',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'headline2 fontSize: ${Theme.of(context).textTheme.headline2!.fontSize} color: ${Theme.of(context).textTheme.headline2!.color}',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            'headline3 fontSize: ${Theme.of(context).textTheme.headline3!.fontSize} color: ${Theme.of(context).textTheme.headline3!.color}',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            'headline4 fontSize: ${Theme.of(context).textTheme.headline4!.fontSize} color: ${Theme.of(context).textTheme.headline4!.color}',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'headline5 fontSize: ${Theme.of(context).textTheme.headline5!.fontSize} color: ${Theme.of(context).textTheme.headline5!.color}',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            'headline6 fontSize: ${Theme.of(context).textTheme.headline6!.fontSize} color: ${Theme.of(context).textTheme.headline6!.color}',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'headlineLarge fontSize: ${Theme.of(context).textTheme.headlineLarge!.fontSize} color: ${Theme.of(context).textTheme.headlineLarge!.color}',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'headlineMedium fontSize: ${Theme.of(context).textTheme.headlineMedium!.fontSize} color: ${Theme.of(context).textTheme.headlineMedium!.color}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'headlineSmall fontSize: ${Theme.of(context).textTheme.headlineSmall!.fontSize} color: ${Theme.of(context).textTheme.headlineSmall!.color}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'labelLarge fontSize: ${Theme.of(context).textTheme.labelLarge!.fontSize} color: ${Theme.of(context).textTheme.labelLarge!.color}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            'labelMedium fontSize: ${Theme.of(context).textTheme.labelMedium!.fontSize} color: ${Theme.of(context).textTheme.labelMedium!.color}',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            'labelSmall fontSize: ${Theme.of(context).textTheme.labelSmall!.fontSize} color: ${Theme.of(context).textTheme.labelSmall!.color}',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            'overline fontSize: ${Theme.of(context).textTheme.overline!.fontSize} color: ${Theme.of(context).textTheme.overline!.color}',
            style: Theme.of(context).textTheme.overline,
          ),
          Text(
            'subtitle1 fontSize: ${Theme.of(context).textTheme.subtitle1!.fontSize} color: ${Theme.of(context).textTheme.subtitle1!.color}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            'subtitle2 fontSize: ${Theme.of(context).textTheme.subtitle2!.fontSize} color: ${Theme.of(context).textTheme.subtitle2!.color}',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'titleLarge fontSize: ${Theme.of(context).textTheme.titleLarge!.fontSize} color: ${Theme.of(context).textTheme.titleLarge!.color}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'titleMedium fontSize: ${Theme.of(context).textTheme.titleMedium!.fontSize} color: ${Theme.of(context).textTheme.titleMedium!.color}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'titleSmall fontSize: ${Theme.of(context).textTheme.titleSmall!.fontSize} color: ${Theme.of(context).textTheme.titleSmall!.color}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Container(),
        ],
      ),
    );
  }
}
