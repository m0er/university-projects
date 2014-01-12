package moer.moerog.module.guestbook;

import java.util.List;

public interface GuestbookService {

	List<Guestbook> getList();

	Long getTotalCount();

	void addGuestbook(Guestbook guestbook);

	void delete(Guestbook guestbook);

}
