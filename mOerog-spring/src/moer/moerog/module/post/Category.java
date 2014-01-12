package moer.moerog.module.post;

public enum Category {
	esl {
		public int getCategory() { return 1; }
	},
	clanbase {
		public int getCategory() { return 2; }
	},
	media {
		public int getCategory() { return 3; }
	};
	
	public abstract int getCategory();
}
