package strilets.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import strilets.model.Search;
import strilets.model.Thing;

@Repository("thingDao")
public class ThingDaoImpl extends AbstrarctDao<Integer, Thing> implements ThingDao {

	public Thing getThingById(int id) {
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
	public List<Thing> getAllThings() {
		Criteria criteria = createEntityCriteria();
		List<Thing> things = criteria.addOrder(Order.desc("id")).list();
		return things;
	}

	@SuppressWarnings("unchecked")
	public List<Thing> getThings(Search search) {
		Criteria criteria = createEntityCriteria();
		criteria.addOrder(Order.desc("id")).list();
		List<Thing> things;

		if (!("".equals(search.getName())))
			criteria.add(Restrictions.like("name", search.getName(), MatchMode.ANYWHERE));

		if (search.isLost() && search.isFound()) {
			things = criteria.list();
		} else if (search.isLost()) {
			criteria.add(Restrictions.like("lostOrFound", "Втрачена", MatchMode.ANYWHERE));
			things = criteria.list();
		} else if (search.isFound()) {
			criteria.add(Restrictions.like("lostOrFound", "Знайдена", MatchMode.ANYWHERE));
			things = criteria.list();
		} else
			things = null;

		return things;
	}

}
