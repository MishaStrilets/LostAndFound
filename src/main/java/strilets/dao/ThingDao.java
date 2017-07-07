package strilets.dao;

import java.util.List;

import strilets.model.Thing;

public interface ThingDao {

	Thing getThingById(int id);

	void saveThing(Thing thing);

	void deleteThing(int id);

	List<Thing> getAllThings();

	List<Thing> getLostThings();

	List<Thing> getFoundThings();

}
