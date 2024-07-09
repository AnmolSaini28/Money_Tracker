import 'package:trackizer/core/models/category_model.dart';
import 'package:trackizer/services/category_image_services.dart';

class CategoryIconService{
  ///First : EXPENSE LIST

  final expenseList = {
    CategoryModel(
      index: 1,
      name: "Home",
      icon: ImageConstants.IMG_PATH_HOME,
    ),
    CategoryModel(
      index: 2,
      name: "Clothing",
      icon: ImageConstants.IMG_PATH_SHIRT,
    ),
    CategoryModel(
      index: 3,
      name: "Recharge/Bills",
      icon: ImageConstants.IMG_PATH_MOBILE,
    ),
    CategoryModel(
      index: 4,
      name: "Shopping",
      icon: ImageConstants.IMG_PATH_SHOPPING,
    ),
    CategoryModel(
      index: 5,
      name: "Groceries",
      icon: ImageConstants.IMG_PATH_VEGETABLES,
    ),
    CategoryModel(
      index: 6,
      name: "Transportation",
      icon: ImageConstants.IMG_PATH_VEHICLE,
    ),
    CategoryModel(
      index: 7,
      name: "Food",
      icon: ImageConstants.IMG_PATH_FOOD,
    ),
    CategoryModel(
      index: 8,
      name: "Health",
      icon: ImageConstants.IMG_PATH_HEALTH,
    ),
    CategoryModel(
      index: 9,
      name: "Sports",
      icon: ImageConstants.IMG_PATH_SPORTS,
    ),
    CategoryModel(
      index: 10,
      name: "Education",
      icon: ImageConstants.IMG_PATH_EDUCATION,
    ),
    CategoryModel(
      index: 11,
      name: "Gym",
      icon: ImageConstants.IMG_PATH_GYM,
    ),
    CategoryModel(
      index: 12,
      name: "Coffee",
      icon: ImageConstants.IMG_PATH_COFFEE,
    ),
    CategoryModel(
      index: 13,
      name: "Fast-Food",
      icon: ImageConstants.IMG_PATH_FAST_FOOD,
    ),
    CategoryModel(
      index: 14,
      name: "Gift",
      icon: ImageConstants.IMG_PATH_GIFT_BOX,
    ),
    CategoryModel(
      index: 15,
      name: "Movie",
      icon: ImageConstants.IMG_PATH_MOVIE,
    ),
    CategoryModel(
      index: 16,
      name: "Makeup",
      icon: ImageConstants.IMG_PATH_MAKEUP,
    ),
    CategoryModel(
      index: 17,
      name: "Entertainment",
      icon: ImageConstants.IMG_PATH_MUSIC,
    ),
    CategoryModel(
      index: 18,
      name: "Popcorn",
      icon: ImageConstants.IMG_PATH_POPCORN,
    ),
    CategoryModel(
      index: 19,
      name: "Restaurant",
      icon: ImageConstants.IMG_PATH_RESTAURANT,
    ),
    CategoryModel(
      index: 20,
      name: "Petrol",
      icon: ImageConstants.IMG_PATH_PETROL,
    ),
    CategoryModel(
      index: 21,
      name: "Snacks",
      icon: ImageConstants.IMG_PATH_SNACK,
    ),
    CategoryModel(
      index: 22,
      name: "Tools",
      icon: ImageConstants.IMG_PATH_TOOLS,
    ),
    CategoryModel(
      index: 23,
      name: "Travel",
      icon: ImageConstants.IMG_PATH_TRAVEL,
    ),
    CategoryModel(
      index: 24,
      name: "Accessories",
      icon: ImageConstants.IMG_PATH_WATCH,
    ),
  };

  /// SECOND : INCOME LIST

  final incomeList = {
    CategoryModel(
      index: 0,
      name: "Salary",
      icon: ImageConstants.IMG_PATH_SALARY,
    ),
    CategoryModel(
      index: 1,
      name: "Awards",
      icon: ImageConstants.IMG_PATH_AWARDS,
    ),
    CategoryModel(
      index: 2,
      name: "Grants",
      icon: ImageConstants.IMG_PATH_GRANTS,
    ),
    CategoryModel(
      index: 3,
      name: "Rental",
      icon: ImageConstants.IMG_PATH_RENTAL,
    ),
    CategoryModel(
      index: 4,
      name: "Investment",
      icon: ImageConstants.IMG_PATH_INVESTMENT,
    ),
    CategoryModel(
      index: 5,
      name: "Lottery",
      icon: ImageConstants.IMG_PATH_LOTTERY,
    ),
  };
}