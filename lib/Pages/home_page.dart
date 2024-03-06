import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrgenerator/Providers/providers.dart';
import 'package:qrgenerator/widgets/button.dart';
import 'package:qrgenerator/widgets/text_field.dart';
import 'package:qrgenerator/widgets/theme_changer.dart';


class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final textController= TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? link;
  bool isSubmitted=false;
  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(loadingProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr Generator'),
        actions: const [
          ThemeChangerButton()
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  MyTextField(label: 'Paste Your Link Here..', controller: textController),
                  const SizedBox(height: 20,),
                  !isLoading?MyButton(label: 'Submit', onTap: (){
                    if(formKey.currentState!.validate()){
                      bool _validURL = Uri.parse(textController.text).isAbsolute;
                      if(_validURL){
                        ref.read(loadingProvider.notifier).update((state) => true);
                        Future.delayed(const Duration(seconds: 2)).then((value){
                          link = textController.text;
                          isSubmitted =true;
                          ref.read(loadingProvider.notifier).update((state) => false);
                        });
                      }
                    }
                  }):const CircularProgressIndicator(),
                  isSubmitted?QrImageView(data: link!,size: 200,backgroundColor: Colors.white,):Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
