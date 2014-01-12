package moer.moerog.module.user;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<User, ObjectId> {

	User findByNickname(String nickname);
	
	User findByUserId(String userId);

}
