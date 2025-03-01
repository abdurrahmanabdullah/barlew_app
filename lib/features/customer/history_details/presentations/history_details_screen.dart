import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widget/custom_text_form_fild.dart';
import '../../../../constant/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';


import '../../../../helpers/ui_helpers.dart';

class HistoryDetailsScreen extends StatefulWidget {
  const HistoryDetailsScreen({super.key});

  @override
  State<HistoryDetailsScreen> createState() => _HistoryDetailsScreenState();
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final addressController = TextEditingController();
  final dateController = TextEditingController();
  final  timeController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    addressController.dispose();
    dateController.dispose();
    timeController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> showDatePickerDialog(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'History Details',
           style: TextFontStyle.text24c192A48500,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(33.h),

              Container(
                padding: EdgeInsets.symmetric(vertical: 11.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F8FF),
                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Container
                      Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.r),
                          image: DecorationImage(
                            image: AssetImage(Assets.icons.reperMan.path),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.red,
                        ),
                      ),
                      UIHelper.horizontalSpace(9.w),

                      // Details Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UIHelper.verticalSpace(11.h),
                            Text(
                              'Repair and Service Plumbers',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              style: TextFontStyle.text15c192A48500roboto,
                            ),
                            UIHelper.verticalSpace(5.h),
                            Text(
                              'Milan Jack',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                               style: TextFontStyle.text15c9198A6roboto,
                            ),
                            UIHelper.verticalSpace(5.h),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(Assets.images.splashImage.path),
                                ),
                                UIHelper.horizontalSpace(5.w),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      Assets.icons.strat.path,
                                      height: 20.h,
                                    ),
                                  ),
                                ),
                                Expanded(flex: 1,child: Text('4.9',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextFontStyle.text14c9198A6roboto,),),
                                UIHelper.horizontalSpace(5.w),
                                Text('(550 Reviews)',maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.justify,
                                  style: TextFontStyle.text14c9198A6roboto,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              UIHelper.verticalSpace(45.h),
              Text(
                'Name',
                style: TextFontStyle.text15cABABABinter400,
              ),
              UIHelper.verticalSpace(15.h),
              CustomTextFormFild(
                hintText: 'Henry Johnson',
                textStyle: TextFontStyle.text14allPrimaryColorText,
                controller: emailController,
              ),
              UIHelper.verticalSpace(13.h),
              Text(
                'Phone',
                style: TextFontStyle.text15cABABABinter400,
              ),
              UIHelper.verticalSpace(13.h),
              CustomTextFormFild(
                hintText: '(555) 555-1234',
                textStyle: TextFontStyle.text14allPrimaryColorText,
                controller: phoneController,
              ),
              UIHelper.verticalSpace(13.h),
              Text(
                'Location',
                style: TextFontStyle.text15cABABABinter400,
              ),
              UIHelper.verticalSpace(13.h),
              CustomTextFormFild(
                hintText: 'e24 NY, Florida, Miami ',
                textStyle: TextFontStyle.text14allPrimaryColorText,
                controller: locationController,
              ),
              UIHelper.verticalSpace(15.h),
              Text(
                'Date',
                style: TextFontStyle.text15cABABABinter400,
              ),
              UIHelper.verticalSpace(13.h),
              CustomTextFormFild(
                hintText: 'DD/MM/YYYY',
                textStyle: TextFontStyle.text14allPrimaryColorText,
                suffixIcon: IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: () => showDatePickerDialog(context),
                  icon: Image.asset(Assets.icons.clender.path,height: 24.h,),
                ),
                controller: dateController,
              ),
              UIHelper.verticalSpace(13.h),
              Text(
                'Available Time',
                style: TextFontStyle.text15cABABABinter400,
              ),
              UIHelper.verticalSpace(13.h),
              CustomTextFormFild(
                hintText: '11:00 AM - 5:00PM',
                textStyle: TextFontStyle.text14allPrimaryColorText,
                controller: timeController,
              ),
              UIHelper.verticalSpace(13.h),
              Text(
                'Category',
                style: TextFontStyle.text15cABABABinter400,
              ),
              UIHelper.verticalSpace(13.h),
              CustomTextFormFild(
                hintText: 'Boiler Pressure',
                textStyle: TextFontStyle.text14allPrimaryColorText,
                controller: categoryController,
              ),
              UIHelper.verticalSpace(13.h),
              //// this is description TextFormField start here////
              Text(
                'Description',
                style: TextFontStyle.text15cABABABinter400,
              ),
              UIHelper.verticalSpace(13.h),

              TextFormField(
                maxLines: 5,
                maxLength: 15,
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Were looking for a reliable and detail-oriented Plumber Helper to help with Pipe fitting and Boiler Fault Service at home. The ideal candidate should have Experience and an understanding of Pipe fitting, ... More',
                  hintStyle: TextFontStyle.text15cc45536Bw400,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.broderColor, width: 1.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide:
                    BorderSide(color: AppColors.broderColor, width: 1.w),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide:
                    BorderSide(color: AppColors.broderColor, width: 1.w),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.red, width: 1.w),
                  ),
                ),
              ),
              //// this is description TextFormField end  here////


              /// this is a gridview for image ////
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Prevent scrolling conflict
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
               childAspectRatio: 1.3,
                  crossAxisSpacing: 5,

                ),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 121.w,
                          height: 71.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            image: DecorationImage(
                              image: AssetImage(Assets.images.imageFour.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        UIHelper.verticalSpace(5.h),

                      ],
                    ),
                  );
                },
              ),
              UIHelper.verticalSpace(11.h),



            ],
          ),
        ),
      ),
    );
  }
}
