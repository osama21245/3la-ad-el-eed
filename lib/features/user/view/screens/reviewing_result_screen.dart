import 'package:_3la_ad_el_eed/features/admin/view/controllers/get%20shops%20cubit/get_shops_state.dart';
import 'package:_3la_ad_el_eed/features/shops/view/screens/add_shop.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/custom_button.dart';
import 'package:_3la_ad_el_eed/features/user/data/data_source/your_shop_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/user/data/repository/your_shop_repository.dart';
import 'package:_3la_ad_el_eed/features/user/view/controller/add%20your%20shop%20cubit/add_your_shop_cubit.dart';
import 'package:_3la_ad_el_eed/features/user/view/controller/delete%20your%20rejected%20request/delete_your_rejected_request_cubit.dart';
import 'package:_3la_ad_el_eed/features/user/view/controller/get%20shops%20cubit/get_your_shop_cubit.dart';
import 'package:_3la_ad_el_eed/features/user/view/controller/get%20shops%20cubit/get_your_shop_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewingResultScreen extends StatelessWidget {
  const ReviewingResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => GetYourShopCubit(
                yourShopRepository: YourShopRepository(
                  yourShopRemoteDataSource: YourShopRemoteDataSource(),
                ),
              )..getYourShop(),
        ),
        BlocProvider(
          create:
              (context) => AddYourShopCubit(
                yourShopsRepository: YourShopRepository(
                  yourShopRemoteDataSource: YourShopRemoteDataSource(),
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => DeleteYourRejectedRequestCubit(
                yourShopsRepository: YourShopRepository(
                  yourShopRemoteDataSource: YourShopRemoteDataSource(),
                ),
              ),
        ),
      ],

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Your Request',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: "PlusJakartaSans",
              color: Color(0xff171212),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close_rounded, size: 28),
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<GetYourShopCubit, GetYourShopState>(
          builder: (context, state) {
            if (state.status == GetYourShopStatus.success) {
              if (state.yourShop != null) {
                if (state.yourShop!.requestStatus == 0) {
                  return Column(
                    children: [
                      SizedBox(height: 84),
                      Center(
                        child: Image.asset(
                          'assets/images/reviewing.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                      SizedBox(height: 24),
                      Center(
                        child: FittedBox(
                          child: Text(
                            'Your request is being reviewed',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: FittedBox(
                          child: Text(
                            '( it takes from 2 to 3 days )',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state.yourShop!.requestStatus == 1) {
                  return Column(
                    children: [
                      SizedBox(height: 84),
                      Center(
                        child: Image.asset(
                          'assets/images/accepted.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              'Congratulations, your order has been accepted, seller 😉',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: CustomButton(
                          onPressed: () {
                            BlocProvider.of<AddYourShopCubit>(
                              context,
                            ).addYourShop(
                              state.yourShop!,
                              state.yourShop!.category,
                            );
                          },
                          text: 'Get started',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'PlusJakartaSans',
                            color: Colors.white,
                          ),
                          borderRadius: 12,
                          backgroundColor: Color(0xffEF8262),
                        ),
                      ),
                    ],
                  );
                } else if (state.yourShop!.requestStatus == -1) {
                  return Column(
                    children: [
                      SizedBox(height: 84),
                      Center(
                        child: Image.asset(
                          'assets/images/reject.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              'Sorry, your request has been rejected : ${state.yourShop!.adminRejectionReasonMessage} \nPlease resubmit the application with the correct information.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: CustomButton(
                          onPressed: () {
                            BlocProvider.of<DeleteYourRejectedRequestCubit>(context).deleteYourRejectedRequest(state.yourShop!);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddShopScreen(),
                              ),
                            );
                          },
                          text: 'Resend Request',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'PlusJakartaSans',
                            color: Colors.white,
                          ),
                          borderRadius: 12,
                          backgroundColor: Color(0xffEF8262),
                        ),
                      ),
                    ],
                  );
                }
              } else {
                return SizedBox();
              }
            } else if (state.status == GetYourShopStatus.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.status == GetYourShopStatus.error) {
              return Center(
                child: Text(state.error!, style: TextStyle(color: Colors.red)),
              );
            }
            return SizedBox(child: Text('no'));
          },
        ),
      ),
    );
  }
}
