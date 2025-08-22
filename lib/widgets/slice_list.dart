import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_bloc.dart';
import 'package:myroulette/models/slice.dart';
import 'package:myroulette/widgets/simple_button.dart';
import 'package:myroulette/widgets/slice_card.dart';

class SliceList extends StatefulWidget {
  const SliceList({super.key});

  @override
  State<SliceList> createState() => _SliceListState();
}

class _SliceListState extends State<SliceList> {

  void _openModal(BuildContext context, List<Slice> list) {
    showModalBottomSheet(
      useSafeArea: true,
      useRootNavigator: true,
      isScrollControlled: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      context: context,
      builder: (modalContext) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(modalContext).viewInsets.bottom),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextButton(
                          onPressed: () => Navigator.pop(modalContext),
                          child: const Icon(Icons.close, color: Colors.black, size: 25),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Text(
                          "Rebanadas:",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Expanded(flex: 3, child: SizedBox()),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) => SliceCard(slice: list[index])
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Slice> list = context.watch<RouletteBloc>().state.slices;
    return SizedBox(
      height: 50,
      width: 160,
      child: SimpleButton(
        label: 'Rebanadas',
        callBack: () => _openModal(context, list),
        btnColor: Color(0XFFFDE74C).withAlpha(95),
        textColor: Colors.purple.shade700,
        icon: Icons.list,
      )
    );
  }
}