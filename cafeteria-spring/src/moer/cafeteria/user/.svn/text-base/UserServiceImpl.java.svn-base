package moer.cafeteria.user;

import moer.cafeteria.persistence.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired UserServiceMapper userServiceMapper;
	Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Override
	public User login(User user) {
		User loginUser = userServiceMapper.getUser(user);
		logger.info(loginUser.toString());
		return loginUser;
	}

}
