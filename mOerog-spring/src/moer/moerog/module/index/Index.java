package moer.moerog.module.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import moer.moerog.module.post.Post;


public class Index {
	private Map<String, List<Post>> postMap = new HashMap<>();
	private Map<String, Long> postCount = new HashMap<>();

	public Map<String, Long> getPostCount() {
		return postCount;
	}

	public void setPostCount(Map<String, Long> postCount) {
		this.postCount = postCount;
	}

	public Map<String, List<Post>> getPostMap() {
		return postMap;
	}

	public void setPostMap(Map<String, List<Post>> postMap) {
		this.postMap = postMap;
	}
}
