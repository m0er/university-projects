package moer.cafeteria.persistence;

import java.util.List;

import moer.cafeteria.user.*;

import org.apache.ibatis.annotations.*;

public interface UserServiceMapper {
	
	@Select("SELECT id, name, department, type FROM client WHERE id = #{id} AND pw = #{pw}")
	User getUser(final User user);
	
	@Select("SELECT * FROM client WHERE type='USER'")
	List<User> getUserList();
	
}
