package strilets.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import strilets.model.Thing;
import strilets.service.ThingService;

@Controller
@RequestMapping("/")
public class AppController {

	@Autowired
	ThingService service;

	@Autowired
	MessageSource messageSource;

	/*
	 * This method will list all things.
	 */
	@RequestMapping(value = { "/", "/list" }, method = { RequestMethod.GET })
	public String listAllThings(ModelMap model) {
		List<Thing> things = service.getAllThings();
		model.addAttribute("things", things);
		return "allthings";
	}

	/*
	 * This method will list all lost things.
	 */
	@RequestMapping(value = { "/lost" }, method = { RequestMethod.GET })
	public String listLostThings(ModelMap model) {
		List<Thing> things = service.getLostThings();
		model.addAttribute("things", things);
		return "allthings";
	}

	/*
	 * This method will list all found things.
	 */
	@RequestMapping(value = { "/found" }, method = { RequestMethod.GET })
	public String listFoundThings(ModelMap model) {
		List<Thing> things = service.getFoundThings();
		model.addAttribute("things", things);
		return "allthings";
	}

	/*
	 * This method will return the statement.
	 */
	@RequestMapping(value = { "/new" }, method = RequestMethod.GET)
	public String newThing(ModelMap model) {
		Thing thing = new Thing();
		model.addAttribute("thing", thing);
		return "statement";
	}

	/*
	 * This method will be called on form submission, handling POST request for
	 * saving thing in database.
	 */
	@RequestMapping(value = { "/new" }, method = RequestMethod.POST)
	public String saveThing(@Valid Thing thing, BindingResult result,
			ModelMap model) {
		if (result.hasErrors()) {
			return "statement";
		}
		service.saveThing(thing);
		List<Thing> things = service.getAllThings();
		model.addAttribute("things", things);
		return "allthings";
	}

	/*
	 * This method will list all things for admin.
	 */
	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public String admin(ModelMap model) {
		List<Thing> things = service.getAllThings();
		model.addAttribute("things", things);
		return "allthings";
	}

	/*
	 * This method will delete an thing by id.
	 */
	@RequestMapping(value = { "/delete-{id}-thing" }, method = RequestMethod.GET)
	public String deleteThing(@PathVariable int id) {
		service.deleteThing(id);
		return "redirect:/admin";
	}

	/*
	 * This method will logout admin.
	 */
	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth != null)
			new SecurityContextLogoutHandler().logout(request, response, auth);
		List<Thing> things = service.getAllThings();
		model.addAttribute("things", things);
		return "allthings";
	}

	/*
	 * This method will return the statement for update an existing thing.
	 */
	@RequestMapping(value = { "/edit-{id}-thing" }, method = RequestMethod.GET)
	public String editThing(@PathVariable Integer id, ModelMap model) {
		Thing thing = service.getThingById(id);
		model.addAttribute("thing", thing);
		model.addAttribute("edit", true);
		return "statement";
	}

	/*
	 * This method will be called on form submission and updating thing in
	 * database.
	 */
	@RequestMapping(value = { "/edit-{id}-thing" }, method = RequestMethod.POST)
	public String updateThing(@Valid Thing thing, BindingResult result,
			ModelMap model, @PathVariable Integer id) {
		if (result.hasErrors()) {
			return "statement";
		}
		service.updateThing(thing);
		return "redirect:/admin";
	}

	/*
	 * This method will list all lost things for admin.
	 */
	@RequestMapping(value = { "/admin-lost" }, method = { RequestMethod.GET })
	public String listLostThingsAdmin(ModelMap model) {
		List<Thing> things = service.getLostThings();
		model.addAttribute("things", things);
		return "allthings";
	}

	/*
	 * This method will list all found things for admin.
	 */
	@RequestMapping(value = { "/admin-found" }, method = { RequestMethod.GET })
	public String listFoundThingsAdmin(ModelMap model) {
		List<Thing> things = service.getFoundThings();
		model.addAttribute("things", things);
		return "allthings";
	}

}
