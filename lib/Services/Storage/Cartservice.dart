// import 'package:netshop/Pages/Product/ProductDetail/ProductContent.dart';
// import 'dart:convert';

// import 'package:netshop/Services/Storage/Storage.dart';

// class CartService {
//   //添加到购物车
//   static addCart(item) async {
//     item = CartService.formatCartDate(item);
//     /*
//           1.获取本地存储的数据

//           2.判断本地存储是否有数据

//               2.1如果有数据

//                   2.1.1。读取本地存储的数据,添加数量

//               2.2如果没有数据直接把当前数据写入
//         */

//     try {
//       //1.获取本地存储的数据
//       List cartListData = json.decode(await Storage.getString("cartList"));

//       // 2.判断本地存储是否有数据
//       bool hasData = cartListData.any((value) {
//         return value['_id'] == item['_id'] &&
//             value['selectAttr'] == item['selectAttr'];
//       });

//       if (hasData) {
//         //2.1如果有数据
//         for (var i = 0; i < cartListData.length; i++) {
//           if (cartListData[i]['_id'] == item['_id'] &&
//               cartListData[i]['selectAttr'] == item['selectAttr']) {
//             //2.1.1。读取本地存储的数据,添加数量
//             cartListData[i]['count'] += item['count'];
//           }
//         }
//         await Storage.setString('cartList', json.encode(cartListData));
//       } else {
//         //2.2如果没有数据直接把当前数据写入
//         cartListData.add(item);
//         await Storage.setString('cartList', json.encode(cartListData));
//       }
//       print(cartListData);
//     } catch (e) {
//       //完全没有数据,当成第一条数据覆盖写入
//       List tempList = [];
//       tempList.add(item);
//       await Storage.setString('cartList', json.encode(tempList));
//     }
//   }

//   //过滤数据和转换 model转map 以及删除model中一些不需要的字段
//   static formatCartDate(item) {
//     final Map data = Map<String, dynamic>();
//     data['_id'] = item.sId;
//     data['title'] = item.title;
//     data['price'] = item.price;
//     data['selectAttr'] = item.selectAttr;
//     data['count'] = item.count;
//     data['pic'] = item.pic;
//     //是否选中
//     data['checked'] = true;
//     return data;
//   }
// }
