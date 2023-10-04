// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:sipunggur_app/src/features/devices/presentation/bloc/monitoring_bloc.dart';
// import 'package:sipunggur_app/src/theme_manager/color_manager.dart';
// import 'package:sipunggur_app/src/theme_manager/font_manager.dart';
// import 'package:sipunggur_app/src/theme_manager/style_manager.dart';

// class GridviewPot extends StatelessWidget {
//   const GridviewPot({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<MonitoringBloc, MonitoringState>(
//       listener: (context, state) {
//         if (state is MonitoringFailed) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.red,
//               content: Text(
//                 state.message,
//                 style: getTextStyle(
//                   FontSizeManager.f14,
//                   FontFamilyConstant.fontFamily,
//                   FontWeightManager.medium,
//                   ColorManager.whiteC,
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         if (state is MonitoringSuccess) {
//           return GridView.count(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisSpacing: 14,
//             mainAxisSpacing: 14,
//             crossAxisCount: 3,
//             children: [
//               if (state.monitoringModel.data!.sensor != null ||
//                   state.monitoringModel.data!.sensor!.isNotEmpty) ...{
//                 ...state.monitoringModel.data!.sensor!.asMap().entries.map((e) {
//                   return GestureDetector(
//                     onTap: () {
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               titlePadding:
//                                   EdgeInsets.only(bottom: 10.h, top: 20.h),
//                               backgroundColor: ColorManager.whiteC,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20)),
//                               title: Center(
//                                 child: Text(
//                                   'Kelembapan Pot ${e.key + 1}',
//                                   style: getTextStyle(
//                                     FontSizeManager.f20,
//                                     FontFamilyConstant.fontFamily,
//                                     FontWeightManager.semiBold,
//                                     ColorManager.blackC,
//                                   ),
//                                 ),
//                               ),
//                               content: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset(
//                                     'assets/icons/soil_icon.svg',
//                                     width: 32.w,
//                                     fit: BoxFit.cover,
//                                   ),
//                                   SizedBox(
//                                     width: 5.w,
//                                   ),
//                                   Text(
//                                     '${0}%',
//                                     style: getTextStyle(
//                                       FontSizeManager.f30,
//                                       FontFamilyConstant.fontFamily,
//                                       FontWeightManager.bold,
//                                       ColorManager.blackC,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               actions: [
//                                 SizedBox(
//                                   width: double.infinity,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 10),
//                                       elevation: 10.w,
//                                       backgroundColor:
//                                           ColorManager.primaryLight,
//                                       shadowColor: ColorManager.primaryLight,
//                                     ),
//                                     child: Text(
//                                       'Oke',
//                                       style: getTextStyle(
//                                         FontSizeManager.f14,
//                                         FontFamilyConstant.fontFamily,
//                                         FontWeightManager.semiBold,
//                                         ColorManager.whiteC,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           });
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: ColorManager.blackC.withOpacity(0.3),
//                       ),
//                       child: Center(
//                         child: Text(
//                           '${e.key + 1}',
//                           style: getTextStyle(
//                             FontSizeManager.f30,
//                             FontFamilyConstant.fontFamily,
//                             FontWeightManager.bold,
//                             ColorManager.whiteC,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               }
//             ],
//           );
//         } else if (state is MonitoringLoading) {
//           return GridView.count(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             // childAspectRatio: 0.57,
//             crossAxisSpacing: 14,
//             mainAxisSpacing: 14,
//             crossAxisCount: 3,
//             children: [
//               for (int i = 1; i < 10; i++) ...{
//                 GestureDetector(
//                   onTap: () {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             titlePadding:
//                                 EdgeInsets.only(bottom: 10.h, top: 20.h),
//                             backgroundColor: ColorManager.whiteC,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20)),
//                             title: Center(
//                               child: Text(
//                                 'Kelembapan Pot $i',
//                                 style: getTextStyle(
//                                   FontSizeManager.f20,
//                                   FontFamilyConstant.fontFamily,
//                                   FontWeightManager.semiBold,
//                                   ColorManager.blackC,
//                                 ),
//                               ),
//                             ),
//                             content: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/icons/soil_icon.svg',
//                                   width: 32.w,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 SizedBox(
//                                   width: 5.w,
//                                 ),
//                                 Text(
//                                   '...%',
//                                   style: getTextStyle(
//                                     FontSizeManager.f30,
//                                     FontFamilyConstant.fontFamily,
//                                     FontWeightManager.bold,
//                                     ColorManager.blackC,
//                                   ),
//                                 )
//                               ],
//                             ),
//                             actions: [
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     padding: EdgeInsets.symmetric(vertical: 10),
//                                     elevation: 10.w,
//                                     backgroundColor: ColorManager.primaryLight,
//                                     shadowColor: ColorManager.primaryLight,
//                                   ),
//                                   child: Text(
//                                     'Oke',
//                                     style: getTextStyle(
//                                       FontSizeManager.f14,
//                                       FontFamilyConstant.fontFamily,
//                                       FontWeightManager.semiBold,
//                                       ColorManager.whiteC,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: ColorManager.blackC.withOpacity(0.3),
//                     ),
//                     child: Center(
//                       child: Text(
//                         '...',
//                         style: getTextStyle(
//                           FontSizeManager.f30,
//                           FontFamilyConstant.fontFamily,
//                           FontWeightManager.bold,
//                           ColorManager.whiteC,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               }
//             ],
//           );
//         }
//         return SizedBox();
//       },
//     );
//   }
// }
