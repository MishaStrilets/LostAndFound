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

	public Thing findById(int id) {
		return dao.findById(id);
	}

	public void saveThing(Thing thing) {
		dao.saveThing(thing);
	}

	public void updateThing(Thing thing) {
		Thing entity = dao.findById(thing.getId());
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

	public List<Thing> findAllThings() {
		return dao.findAllThings();
	}

	public List<Thing> lostThings() {
		return dao.lostThings();
	}

	public List<Thing> foundThings() {
		return dao.foundThings();
	}

}
