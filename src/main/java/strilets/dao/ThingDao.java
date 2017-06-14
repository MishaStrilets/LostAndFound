package strilets.dao;

import java.util.List;

import strilets.model.Thing;

public interface ThingDao {

	Thing findById(int id);

	void saveThing(Thing thing);

	void deleteThing(int id);

	List<Thing> findAllThings();

	List<Thing> lostThings();

	List<Thing> foundThings();

}
