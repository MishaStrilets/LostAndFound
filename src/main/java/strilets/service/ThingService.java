package strilets.service;

import java.util.List;

import strilets.model.Thing;

public interface ThingService {

	Thing findById(int id);

	void saveThing(Thing thing);

	void updateThing(Thing thing);

	void deleteThing(int id);

	List<Thing> findAllThings();

	List<Thing> lostThings();

	List<Thing> foundThings();

}
