import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/address/widgets/address_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address", style: AppStyles.primaryHeadLinesStyle,),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const HeightSpace(height: 20),
            Text("Saved Address", style: AppStyles.black15w700Style,),
            const HeightSpace(height: 24),
            Expanded(
              child: ListView(
                children: [
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                  AddressItemWidget(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
