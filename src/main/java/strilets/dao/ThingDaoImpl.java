package strilets.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import strilets.model.Thing;

@Repository("thingDao")
public class ThingDaoImpl extends AbstrarctDao<Integer, Thing> implements ThingDao {

	public Thing findById(int id) {
		return getByKey(id);
	}

	public void saveThing(Thing thing) {
		persist(thing);
	}

	public void deleteThing(int id) {
		Query query = getSession().createSQLQuery("delete from Thing where id = :id");
		query.setLong("id", id);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Thing> findAllThings() {
		Criteria criteria = createEntityCriteria();
		return (List<Thing>) criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<Thing> lostThings() {
		Criteria criteria = createEntityCriteria();
		List<Thing> things = criteria.add(Restrictions.like("lostOrFound", "Lost", MatchMode.ANYWHERE)).list();
		return things;
	}

	@SuppressWarnings("unchecked")
	public List<Thing> foundThings() {
		Criteria criteria = createEntityCriteria();
		List<Thing> things = criteria.add(Restrictions.like("lostOrFound", "Found", MatchMode.ANYWHERE)).list();
		return things;
	}
}
