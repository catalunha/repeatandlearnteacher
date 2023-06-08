import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/models/team_model.dart';
import '../../utils/app_import_image.dart';
import '../../utils/app_mixin_loader.dart';
import '../../utils/app_mixin_messages.dart';
import '../../utils/app_textformfield.dart';
import '../list/controller/providers.dart';
import 'controller/providers.dart';
import 'controller/states.dart';

class TeamSavePage extends ConsumerStatefulWidget {
  final TeamModel? teamModel;
  const TeamSavePage({
    Key? key,
    required this.teamModel,
  }) : super(key: key);

  @override
  ConsumerState<TeamSavePage> createState() => _TeamSaveState();
}

class _TeamSaveState extends ConsumerState<TeamSavePage> with Loader, Messages {
  final _formKey = GlobalKey<FormState>();
  final _nameTEC = TextEditingController();
  final _descriptionTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameTEC.text = widget.teamModel?.name ?? '';
    _descriptionTEC.text = widget.teamModel?.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<TeamSaveState>(
      teamSaveProvider(teamModel: widget.teamModel),
      (previous, next) {
        if (next.status == TeamSaveStatus.error) {
          hideLoader(context);
          showMessageError(context, next.error);
        }
        if (next.status == TeamSaveStatus.loading) {
          showLoader(context);
        }
        if (next.status == TeamSaveStatus.success) {
          ref.invalidate(teamListProvider);
          hideLoader(context);
          context.pop();
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title:
            Text('${widget.teamModel == null ? "Adicionar" : "Editar"} Team'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextFormField(
                label: 'Name',
                controller: _nameTEC,
                validator: Validatorless.required('Name é obrigatório'),
              ),
              const SizedBox(height: 5),
              AppTextFormField(
                label: 'Description',
                controller: _descriptionTEC,
                validator: Validatorless.required('Description é obrigatório'),
              ),
              const SizedBox(height: 5),
              AppImportImage(
                label: 'Click aqui para buscar para o grupo.',
                imageUrl: widget.teamModel?.image,
                setXFile: (value) =>
                    ref.read(xFileProvider.notifier).state = value,
                maxHeightImage: 150,
                maxWidthImage: 100,
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('send1...');
            final formValid = _formKey.currentState?.validate() ?? false;
            if (formValid) {
              print('send2...');
              ref
                  .read(teamSaveProvider(teamModel: widget.teamModel).notifier)
                  .submitForm(
                    name: _nameTEC.text,
                    description: _descriptionTEC.text,
                  );
            }
          },
          child: const Icon(Icons.cloud_upload_outlined)),
    );
  }
}
