package strilets.model;

public class Search {

	public Search() {
	}

	private boolean lost;

	private boolean found;

	private String name;

	public boolean isLost() {
		return lost;
	}

	public void setLost(boolean lost) {
		this.lost = lost;
	}

	public boolean isFound() {
		return found;
	}

	public void setfound(boolean found) {
		this.found = found;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Search [name=" + name + ", lost=" + lost + ", found=" + found + "]";
	}

}
