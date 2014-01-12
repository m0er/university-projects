package moer.meetup.user;

import moer.meetup.persistence.UserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserService {
	@Autowired private UserMapper userMapper;
	
	public void register(User user) {
		userMapper.insert(user);
	}
	
	public boolean verify(User user) {
		String email = user.getEmail();
		User selectedUser = userMapper.selectByEmail(email);
		
		if (email.equals(selectedUser.getEmail()))
			return true;
		
		return false;
	}
	
}
