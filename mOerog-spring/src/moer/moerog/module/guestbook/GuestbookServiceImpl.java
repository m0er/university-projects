package moer.moerog.module.guestbook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("guestbookService")
public class GuestbookServiceImpl implements GuestbookService {
	@Autowired private GuestbookRepository guestbookRepository;
	
	@Override
	public List<Guestbook> getList() {
		return guestbookRepository.findAll();
	}

	@Override
	public Long getTotalCount() {
		return guestbookRepository.count();
	}

	@Override
	public void addGuestbook(Guestbook guestbook) {
		guestbookRepository.save(guestbook);
	}

	@Override
	public void delete(Guestbook guestbook) {
		guestbookRepository.delete(guestbook);
	}

}
