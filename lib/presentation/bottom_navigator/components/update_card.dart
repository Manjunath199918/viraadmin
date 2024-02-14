part of '../view.dart';

class UpdateCard extends StatelessWidget {
  const UpdateCard({this.upgrader, required this.currentTheme, super.key});

  final Upgrader? upgrader;
  final KThemeState currentTheme;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: 30.toHorizontalPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: 200.toAutoScaledWidth,
              child: Image.asset('assets/icons/img_16.png'),
            ),
            6.toVerticalSizedBox,
            Text(
              "We're better than ever!",
              style: TextStyle(
                fontSize: currentTheme.themeBox.fontSizes.s16,
                fontWeight: currentTheme.themeBox.fontWeights.wBold,
                color: currentTheme.themeBox.colors.primary,
                height: currentTheme.themeBox.fontLineHeights.lh18 /
                    currentTheme.themeBox.fontSizes.s16,
              ),
            ),
            15.toVerticalSizedBox,
            Text(
              'We have added lots of new features and fix some'
              ' bugs to make your experience as smooth as possible',
              style: TextStyle(
                fontSize: currentTheme.themeBox.fontSizes.s12,
                fontWeight: currentTheme.themeBox.fontWeights.wRegular,
                color: currentTheme.themeBox.colors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            25.toVerticalSizedBox,
            KFlatButton(
              onPressed: () {
                if (upgrader == null) return;

                // Redirect for update
                upgrader!.onUserUpdated(
                  context,
                  !upgrader!.blocked(),
                );
              },
              isPrimary: false,
              child: Text(
                'UPDATE',
                style: TextStyle(
                  fontSize: currentTheme.themeBox.fontSizes.s16,
                  fontWeight: currentTheme.themeBox.fontWeights.wBold,
                  color: currentTheme.themeBox.colors.white,
                ),
              ),
            ),
            // Visible only when current app version > minVersion
            Visibility(
              visible: !upgrader!.blocked(),
              child: TextButton(
                onPressed: () {
                  // Pops the current upgrader
                  upgrader!.onUserLater(context, true);
                },
                child: Text(
                  'Quit',
                  style: TextStyle(
                    fontSize: currentTheme.themeBox.fontSizes.s16,
                    fontWeight: currentTheme.themeBox.fontWeights.wBold,
                    color: currentTheme.themeBox.colors.onBackgroundVariant,
                  ),
                ),
              ),
            ),
            10.toVerticalSizedBox,
          ],
        ),
      ),
    );
  }
}
