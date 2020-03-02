import 'package:flutter_name/generated/json/base/json_convert_content.dart';

class BannerBeanEntity with JsonConvert<BannerBeanEntity> {
	List<BannerBeanResult> result;
	String message;
	String status;
}

class BannerBeanResult with JsonConvert<BannerBeanResult> {
	String imageUrl;
	String jumpUrl;
	int rank;
}
