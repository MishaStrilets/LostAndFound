package strilets.service;

import java.util.List;

import strilets.model.Thing;

public interface ThingService {

	Thing getThingById(int id);

	void saveThing(Thing thing);

	void updateThing(Thing thing);

	void deleteThing(int id);

	List<Thing> getAllThings();

	List<Thing> getLostThings();

	List<Thing> getFoundThings();

}
