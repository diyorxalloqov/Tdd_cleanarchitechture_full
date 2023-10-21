import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/domain/entity/user_entity.dart';

class UserCard extends StatelessWidget {
  final UserEntity entity;

  const UserCard({required this.entity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(entity.firstName),
            const SizedBox(
              width: 4,
            ),
            Text(entity.lastName),
            const Spacer(),
            CachedNetworkImage(
              imageUrl: entity.image,
              width: 50,
              height: 50,
            )
          ],
        ),
      );
}
