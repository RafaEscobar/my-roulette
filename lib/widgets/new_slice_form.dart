import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:myroulette/widgets/simple_button.dart';

class NewSliceForm extends StatefulWidget {
  const NewSliceForm({super.key});

  @override
  State<NewSliceForm> createState() => _NewSliceFormState();
}

class _NewSliceFormState extends State<NewSliceForm> {
  final TextEditingController _searchController = TextEditingController();
  Color screenColor = Colors.blue; // 👈 color inicial

  void _openModal(BuildContext context) {
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
                          "Nuevo elemento",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Expanded(flex: 3, child: SizedBox()),
                    ],
                  ),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Elemento',
                      labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () => (),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Selecciona el color:", style: TextStyle(fontSize: 18),),
                  ColorPicker(
                    color: screenColor,
                    onColorChanged: (Color color) => setState(() => screenColor = color),
                    width: 40,
                    height: 40,
                    borderRadius: 30,
                    pickersEnabled: const <ColorPickerType, bool>{
                      ColorPickerType.wheel: true,
                      ColorPickerType.accent: false,
                      ColorPickerType.primary: false,
                      ColorPickerType.both: false,
                      ColorPickerType.custom: false,
                    },
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: SimpleButton(
                          label: 'Cancelar',
                          callBack: () => Navigator.of(context).pop(),
                          btnColor: Colors.red.withAlpha(200),
                          textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 18),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        ),
                      ),
                      Expanded(
                        child: SimpleButton(
                          label: 'Guardar',
                          callBack: () {},
                          btnColor: Colors.lightGreen.withAlpha(150),
                          textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 18),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        ),
                      ),

                    ],
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
      child: SimpleButton(
        label: 'Agregar elemento',
        callBack: () => _openModal(context),
        btnColor: Color(0XFFFDE74C).withAlpha(95),
        textColor: Colors.purple.shade700,
        icon: Icons.add,
      )
    );
  }
}