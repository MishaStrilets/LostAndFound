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

import strilets.model.Search;
import strilets.model.Thing;
import strilets.service.ThingService;

@Controller
@RequestMapping("/")
public class AppController {

	@Autowired
	ThingService service;

	@Autowired
	MessageSource messageSource;

	/**
	 * This method will list all things.
	 */
	@RequestMapping(value = { "/", }, method = RequestMethod.GET)
	public String listThings(ModelMap model) {
		List<Thing> things = service.getAllThings();
		model.addAttribute("things", things);
		Search search = new Search();
		model.addAttribute("search", search);
		return "allthings";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * searching things in database.
	 */
	@RequestMapping(value = { "/" }, method = RequestMethod.POST)
	public String searchThings(Search search, ModelMap model) {
		List<Thing> things = service.getThings(search);
		model.addAttribute("things", things);
		model.addAttribute("search", search);
		return "allthings";
	}

	/**
	 * This method will return the statement.
	 */
	@RequestMapping(value = { "/new" }, method = RequestMethod.GET)
	public String newThing(ModelMap model) {
		Thing thing = new Thing();
		model.addAttribute("thing", thing);
		return "statement";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * saving thing in database.
	 */
	@RequestMapping(value = { "/new" }, method = RequestMethod.POST)
	public String saveThing(@Valid Thing thing, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "statement";
		}
		service.saveThing(thing);
		return "redirect:/";
	}

	/**
	 * This method will login admin.
	 */
	@RequestMapping(value = { "/admin" })
	public String adminLogin() {
		return "redirect:/";
	}

	/**
	 * This method will delete an thing by id.
	 */
	@RequestMapping(value = { "/delete-{id}-thing" }, method = RequestMethod.GET)
	public String deleteThing(@PathVariable int id) {
		service.deleteThing(id);
		return "redirect:/";
	}

	/**
	 * This method will logout admin.
	 */
	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null)
			new SecurityContextLogoutHandler().logout(request, response, auth);
		return "redirect:/";
	}

	/**
	 * This method will return the statement for update an existing thing.
	 */
	@RequestMapping(value = { "/edit-{id}-thing" }, method = RequestMethod.GET)
	public String editThing(@PathVariable Integer id, ModelMap model) {
		Thing thing = service.getThingById(id);
		model.addAttribute("thing", thing);
		model.addAttribute("edit", true);
		return "statement";
	}

	/**
	 * This method will be called on form submission and updating thing in
	 * database.
	 */
	@RequestMapping(value = { "/edit-{id}-thing" }, method = RequestMethod.POST)
	public String updateThing(@Valid Thing thing, BindingResult result, ModelMap model, @PathVariable Integer id) {
		if (result.hasErrors()) {
			return "statement";
		}
		service.updateThing(thing);
		return "redirect:/";
	}

}
