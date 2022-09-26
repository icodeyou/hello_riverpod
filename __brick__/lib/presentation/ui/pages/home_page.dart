import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_riverpod/domain/usecase/get_current_weather_use_case.dart';

import '../../../domain/domain_module.dart';
import '../../../domain/model/weather.dart';
import '../../controller/home_controller.dart';
import '../../states/home_state.dart';
import '../constants/strings.dart';
import '../routing/app_routes.dart';
import '../styles/decorations.dart';
import '../styles/ui_constants.dart';
import '../widgets/widget_error_details.dart';
import '../widgets/widget_main_button.dart';
import '../widgets/widget_progress.dart';

final homerController =
    StateNotifierProvider.autoDispose<HomeController, HomeState>((ref) {
  GetWeatherUseCase weatherUseCase = ref.watch(getWeatherUseCaseProvider);
  return HomeController(getCurrentWeatherUseCase: weatherUseCase);
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: _body(context, ref),
    );
  }

  Widget _body(BuildContext context, WidgetRef ref) {
    var state = ref.watch(homerController);
    return state.when(
      init: () => const ProgressWidget(),
      loading: () => const ProgressWidget(),
      error: (exception) {
        return ErrorDetailsWidget(
            errorDebugMessage: exception.toString(),
            retryCallback: () async {
              ref.read(homerController.notifier).getWeather();
            });
      },
      success: (weather) => _loadedScreen(context, weather),
    );
  }

  Widget _loadedScreen(BuildContext context, Weather weather) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(UI.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: UI.defaultPadding),
            Container(
              decoration: Decorations.box,
              padding: const EdgeInsets.all(UI.defaultPadding),
              child: Column(
                children: [
                  const SizedBox(height: UI.defaultPadding),
                  Text(
                    weather.city,
                    style: const TextStyle(
                        fontSize: UI.textL, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: UI.defaultPadding),
                  Text(
                    '${weather.tempCelsius} °C',
                    style: const TextStyle(fontSize: UI.textM),
                  ),
                  const SizedBox(height: UI.defaultPadding),
                ],
              ),
            ),
            const SizedBox(height: UI.defaultPadding),
            Center(
              child: MainButtonWidget(
                message: Strings.sayHelloButton,
                onPressed: () async {
                  GoRouter.of(context).push(AppRoutes.routeSayHello);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
