import 'package:dartz/dartz.dart';

import '../../../../data/api/failures.dart';
import '../../../entities/getCartResponseEntity.dart';

abstract class CartRemoteDataSource{
  Future<Either<Failures,GetCartResponseEntity>>getCart();
}