
import 'package:flutter_name/generated/json/base/json_convert_content.dart';

class DetaBeanEntity with JsonConvert<DetaBeanEntity> {
	DetaBeanResult result;
	String message;
	String status;
}

class DetaBeanResult with JsonConvert<DetaBeanResult> {
	int commentNum;
	String duration;
	String imageUrl;
	List<DetaBeanResultMovieActor> movieActor;
	List<DetaBeanResultMovieDirector> movieDirector;
	int movieId;
	String movieType;
	String name;
	String placeOrigin;
	List<String> posterList;
	int releaseTime;
	double score;
	List<DetaBeanResultShortFilmList> shortFilmList;
	String summary;
	int whetherFollow;
}

class DetaBeanResultMovieActor with JsonConvert<DetaBeanResultMovieActor> {
	String name;
	String photo;
	String role;
}

class DetaBeanResultMovieDirector with JsonConvert<DetaBeanResultMovieDirector> {
	String name;
	String photo;
}

class DetaBeanResultShortFilmList with JsonConvert<DetaBeanResultShortFilmList> {
	String imageUrl;
	String videoUrl;
}
