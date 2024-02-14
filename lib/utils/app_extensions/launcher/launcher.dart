part of '../app_extension.dart';

class KLauncher {
  KLauncher._();

  Future<bool> launchUrl(
    Uri uri, {
    urlStringLauncher.LaunchMode mode = urlStringLauncher.LaunchMode.externalApplication,
    urlStringLauncher.WebViewConfiguration webViewConfiguration = const urlStringLauncher.WebViewConfiguration(),
  }) async {
    if (await urlLauncher.canLaunchUrl(uri)) {
      return await urlLauncher.launchUrl(
        uri,
        mode: mode,
        webViewConfiguration: webViewConfiguration,
      );
    } else {
      log("[launchUrl:] Can't launch url");
      return false;
    }
  }

  Future<bool> launchUrlString(
    String url, {
    urlStringLauncher.LaunchMode mode = urlStringLauncher.LaunchMode.externalApplication,
    urlStringLauncher.WebViewConfiguration webViewConfiguration = const urlStringLauncher.WebViewConfiguration(),
  }) async {
    if (await urlStringLauncher.canLaunchUrlString(url)) {
      return await urlStringLauncher.launchUrlString(
        url,
        mode: mode,
        webViewConfiguration: webViewConfiguration,
      );
    } else {
      log("[launchUrlString:] Can't launch url");
      return false;
    }
  }

  Future<bool> launchUrlWithoutValidation(Uri uri) async {
    return await urlLauncher.launchUrl(
      uri,
      mode: urlStringLauncher.LaunchMode.externalApplication,
    );
  }

  Future<bool> launchUrlStringWithoutValidation(String url) async {
    if (!url.contains('http')) {
      url = 'https://$url';
    }

    return await urlStringLauncher.launchUrlString(
      url,
      mode: urlStringLauncher.LaunchMode.externalApplication,
    );
  }
}
