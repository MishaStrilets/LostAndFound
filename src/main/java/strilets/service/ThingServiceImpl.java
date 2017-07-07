package strilets.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import strilets.dao.ThingDao;
import strilets.model.Thing;

@Service("thingService")
@Transactional
public class ThingServiceImpl implements ThingService {

	@Autowired
	private ThingDao dao;

	public Thing getThingById(int id) {
		return dao.getThingById(id);
	}

	public void saveThing(Thing thing) {
		dao.saveThing(thing);
	}

	public void updateThing(Thing thing) {
		Thing entity = dao.getThingById(thing.getId());
		if (entity != null) {
			entity.setName(thing.getName());
			entity.setPlace(thing.getPlace());
			entity.setDate(thing.getDate());
			entity.setPhoneNumber(thing.getPhoneNumber());
			entity.setLostOrFound(thing.getLostOrFound());
		}
	}

	public void deleteThing(int id) {
		dao.deleteThing(id);
	}

	public List<Thing> getAllThings() {
		return dao.getAllThings();
	}

	public List<Thing> getLostThings() {
		return dao.getLostThings();
	}

	public List<Thing> getFoundThings() {
		return dao.getFoundThings();
	}

}
