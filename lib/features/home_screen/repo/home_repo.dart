import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home_screen/models/products_model.dart';
import '../../../core/networking/api_endpoints.dart';
import '../../../core/networking/dio_helper.dart';
import '../models/categories_model.dart';

class HomeRepo{
  final DioHelper _dioHelper;
  HomeRepo(this._dioHelper);

  // Future<Either<String, List<ProductsModel>>> getProducts() async {
  //   try {
  //     final response = await _dioHelper.getRequest(endPoint: ApiEndpoints.product);
  //
  //     print("📥 Raw API Response: ${response.data}");
  //
  //     if (response.statusCode == 200) {
  //       if (response.data is List) {
  //         List<ProductsModel> products = productsModelFromJson(response.data);
  //         print("✅ Parsed ${products.length} products successfully");
  //         return Right(products);
  //       } else {
  //         print("❌ Error: API response is not a List");
  //         return Left("Unexpected response format");
  //       }
  //     } else {
  //       print("❌ API Error: Something went wrong");
  //       return Left("Something went wrong");
  //     }
  //   } catch (e) {
  //     print("❌ Exception: $e");
  //     return Left(e.toString());
  //   }
  // }


  Future < Either<String, List<ProductsModel>> > getProducts() async {
    try{
      final response = await _dioHelper.getRequest(
          endPoint: ApiEndpoints.product);
      if(response.statusCode == 200){
        List<ProductsModel> Products = productsModelFromJson(response.data);
        return Right(Products);
      }else{
        return Left("Something went wrong");
      }
    }catch(e){
      return Left(e.toString());
    }
  }


  Future < Either<String, List<ProductsModel>> > getProductCategories(String categoryName) async {
    try{
      final response = await _dioHelper.getRequest(
          endPoint: "${ApiEndpoints.product}/${ApiEndpoints.catProduct}/$categoryName");
      if(response.statusCode == 200){
        List<ProductsModel> Products = productsModelFromJson(response.data);
        return Right(Products);
      }else{
        return Left("Something went wrong");
      }
    }catch(e){
      return Left(e.toString());
    }
  }


  Future < Either<String, List<String>> > getCategories() async {
    try{
      final response = await _dioHelper.getRequest(
          endPoint: ApiEndpoints.categories);
      if(response.statusCode == 200){
        List<String> categories = categoriesModelFromJson(response.data);
        categories.insert(0, "All");
        return Right(categories);
      }else{
        return Left("Something went wrong");
      }
    }catch(e){
      return Left(e.toString());
    }
  }

}