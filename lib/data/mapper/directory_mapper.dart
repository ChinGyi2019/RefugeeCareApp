import 'package:refugee_care_mobile/data/model/directory/directory_data.dart';
import 'package:refugee_care_mobile/domain/model/directory/directory.dart';

extension DirectoryMapper on DirectoryData {
  Directory toDomain() {
    return Directory(
      name: name ?? '',
      id: id ?? '',
      job: job ?? '',
      image: image ?? [],
      tag: tag ?? [],
      description: description ?? '',
      phone: phone ?? [],
      email: email ?? [],
    );
  }
}
