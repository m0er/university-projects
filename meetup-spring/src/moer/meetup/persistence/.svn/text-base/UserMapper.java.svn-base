package moer.meetup.persistence;

import java.util.List;

import moer.meetup.user.User;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {
	
	@Insert("INSERT INTO user(email, password) VALUES(#{email}, #{password})")
	void insert(User user);
	
	@Select("SELECT email FROM user")
	List<User> selectAll();
	
	@Delete("DELETE FROM user")
	void deleteAll();
	
	@Select("SELECT count(*) FROM user")
	int count();
	
	@Select("SELECT email, password FROM user WHERE email=#{email}")
	User selectByEmail(String email);
}
