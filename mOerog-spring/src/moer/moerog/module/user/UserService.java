package moer.moerog.module.user;


public interface UserService {

	public abstract User adminLogin(User user);

	public abstract User login(User user);

	public abstract void register(User user);

}