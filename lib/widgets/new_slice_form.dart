import 'package:flutter/material.dart';

class NewSliceForm extends StatelessWidget {
  const NewSliceForm({super.key});

  void _openModal(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      context: context,
      builder: (modalContext) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(modalContext).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
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
                          "Nuevo elemento",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Expanded(flex: 3, child: SizedBox()),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: Placeholder(),
                  )
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
    return SizedBox(
      height: 50,
      width: 210,
      child: GestureDetector(
        onTap: () => _openModal(context),
        child: Container(
          height: 50,
          width: 210,
          decoration: BoxDecoration(
            color: Color(0XFFFDE74C).withAlpha(150),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              Icon(Icons.add, size: 26, color: Colors.purple.shade700,),
              Text("Agregar elemento", style: TextStyle(fontSize: 18, color: Colors.purple.shade700),)
            ],
          ),
        ),
      ),
    );
  }
}