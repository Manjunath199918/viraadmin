import 'package:auto_route/auto_route.dart';
import 'package:viraadmin/modules/data/core/router/router.dart';

export 'intrinsic_router.gr.dart';

// NOTE: Don't import this file ever in other parts of app
// NOTE: Don't touch this file unless you're sure what you're doing.
//Can change to @MaterialAutoRouter or @CustomAutoRouter(tip:to define global custom route transitions)
//TODO: it should be custom or cupertino
@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: KRoutesRegistry.routes,
)
class $IntrinsicRouter {}
