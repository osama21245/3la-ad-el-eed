import 'package:_3la_ad_el_eed/features/shops/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/theme/app_palette.dart';
import '../controllers/block_user_cubit.dart';
import '../controllers/block_user_states.dart';


class BlockUser extends StatelessWidget {
  const BlockUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<BlockUserCubit>(),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<BlockUserCubit, BlockUserState>(
            listener: (context, state) {
              if (state is BlockUserSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("User successfully blocked")),
                );
              } else if (state is BlockUserError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              return SizedBox(
                height: 60,
                width: 150,
                child: CustomButton(
                  text: state is BlockUserLoading ? "Loading..." : "Block user",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff171212),
                    fontWeight: FontWeight.w700,
                  ),
                  onPressed: () {
                    sl<BlockUserCubit>().blockUser("4iUxe2xwauPYSe7KcRzM19ylaF32");
                  },
                backgroundColor: AppPalette.mainColor, borderRadius: 10,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
