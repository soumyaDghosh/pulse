import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import '../../build_context_x.dart';
import '../weather_model.dart';

class CitySearchField extends StatefulWidget {
  const CitySearchField({
    super.key,
  });

  @override
  State<CitySearchField> createState() => _CitySearchFieldState();
}

class _CitySearchFieldState extends State<CitySearchField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = di<WeatherModel>();
    final theme = context.theme;
    var textField = TextField(
      autofocus: true,
      onSubmitted: (value) => model.loadWeather(cityName: _controller.text),
      controller: _controller,
      onTap: () {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.value.text.length,
        );
      },
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        fillColor: theme.colorScheme.onSurface.withOpacity(0.2),
        prefixIcon: const Icon(
          YaruIcons.search,
          size: 15,
        ),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        prefixIconConstraints:
            const BoxConstraints(minWidth: 35, minHeight: 30),
        filled: true,
        hintText: 'Cityname',
        suffixIconConstraints: const BoxConstraints(
          maxHeight: kYaruTitleBarItemHeight,
          minHeight: kYaruTitleBarItemHeight,
          minWidth: kYaruTitleBarItemHeight,
          maxWidth: kYaruTitleBarItemHeight,
        ),
        // suffixIcon: ClipRRect(
        //   borderRadius: const BorderRadius.only(
        //     topRight: Radius.circular(kYaruButtonRadius),
        //     bottomRight: Radius.circular(kYaruButtonRadius),
        //   ),
        //   child: Material(
        //     color: Colors.transparent,
        //     child: InkWell(
        //       child: const Icon(
        //         YaruIcons.location,
        //       ),
        //       onTap: () => model.init(cityName: null),
        //     ),
        //   ),
        // ),
      ),
    );
    return textField;
  }
}
