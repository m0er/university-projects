package moer.moerog.module.guestbook;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface GuestbookRepository extends MongoRepository<Guestbook, ObjectId> {

}
