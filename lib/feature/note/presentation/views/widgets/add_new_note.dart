import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/helpers/generate_id.dart';
import 'package:nota/core/widgets/custom_text_buttom_with_background_color.dart';
import 'package:nota/core/widgets/custom_text_form_feild.dart';
import 'package:nota/feature/note/domain/entity/note_entity.dart';
import 'package:nota/feature/note/presentation/manager/cubit/note_cubit.dart';

class AddNewNoteViewBody extends StatefulWidget {
  const AddNewNoteViewBody({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<AddNewNoteViewBody> createState() => _AddNewNoteViewBodyState();
}

class _AddNewNoteViewBodyState extends State<AddNewNoteViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Note'), centerTitle: true),
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),

                CustomTextFormFeild(
                  onSaved: (value) {
                    title = value!;
                  },
                  textInputType: TextInputType.text,
                  labelText: 'title',
                ),
                const SizedBox(height: 24),

                CustomTextFormFeild(
                  onSaved: (value) {
                    subTitle = value!;
                  },

                  maxlines: 5,
                  textInputType: TextInputType.text,
                  hint: 'content',
                ),
                const SizedBox(height: 24),
                CustomTextBottomWithBackground(
                  isLoading: widget.isLoading,
                  text: 'Add Note',
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      context.read<NoteCubit>().addNote(
                        note: NoteEntity(
                          title: title,
                          subTitle: subTitle,
                          uID: generateUID(),
                        ),
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),

                SizedBox(height: 12,),
                CustomTextBottomWithBackground(text: 'throw ex ',ontap: ()=>throw Exception(),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
