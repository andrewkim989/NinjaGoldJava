package com.andrewkim.ninjagold;

import javax.servlet.http.HttpSession;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.ArrayList;

@Controller
@SpringBootApplication
public class NinjaGoldApplication {

	public static void main(String[] args) {
		SpringApplication.run(NinjaGoldApplication.class, args);
	}
	
	@RequestMapping("/")
	public String ninja(HttpSession session) {
		if (session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
			session.setAttribute("getgold", 0);
			ArrayList<String> message = new ArrayList <String>();
			session.setAttribute("message", message);
		}
		int gold = (int) session.getAttribute("gold");
		if (gold < - 99) {
			return "gameover.jsp";
		}
		else {
			return "ninjagold.jsp";
		}
	}
	
	@RequestMapping(value = "/gold", method = RequestMethod.POST)
	public String gold(@RequestParam (value = "building") String building, HttpSession session) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("EEEE, MMMM dd, yyyy; hh:mm a");
		String date = sdf.format(d);
		@SuppressWarnings("unchecked")
		ArrayList<String> message = (ArrayList<String>) session.getAttribute("message");
		int gold = (int) session.getAttribute("gold");
		Random r = new Random();
		
		if (building.equals("market")) {
			int getgold = r.nextInt(21 - 10) + 10;
			gold = gold + getgold;
			session.setAttribute("gold", gold);
			session.setAttribute("getgold", getgold);
			message.add("You have entered the " + building + " by blending with the crowd and managed to get " + getgold + " gold.  (" + date + ") " );
			return "redirect:/";
		}
		else if (building.equals("cave")) {
			int getgold = r.nextInt(11 - 5) + 5;
			gold = gold + getgold;
			session.setAttribute("getgold", getgold);
			session.setAttribute("gold", gold);
			message.add("You have discovered an abandoned hideout in the " + building + " and found " + getgold + " gold.  (" + date + ") " );
			return "redirect:/";
		}
		else if (building.equals("shack")) {
			int getgold = r.nextInt(6 - 2) + 2;
			gold = gold + getgold;
			session.setAttribute("getgold", getgold);
			session.setAttribute("gold", gold);
			message.add("You have found a " + building + " in the middle of a forest and found " + getgold + " gold.  (" + date + ") " );
			return "redirect:/";
		}
		else if (building.equals("bank")) {
			int getgold = r.nextInt(51 + 50) - 50;
			gold = gold + getgold;
			session.setAttribute("getgold", getgold);
			session.setAttribute("gold", gold);
			if (getgold > 0) {
				message.add("You have snuck into the " + building + " and managed to steal " + getgold + " gold.  (" + date + ") " );
			}
			else if (getgold == 0) {
				message.add("Your raid at the " + building + " was unsuccessful, and you leave the bank with no gold lost or gained.  (" + date + ") " );
			}
			else {
				message.add("You've been caught stealing the " + building + "! You manage to escape successfully, but you lose " + -(getgold) + " gold in the process.  (" + date + ") " );
			}
			return "redirect:/";
		}
		else {
			int getgold = r.nextInt(16) -20 ;
			gold = gold + getgold;
			session.setAttribute("getgold", getgold);
			session.setAttribute("gold", gold);
			message.add("You visit a " + building + " and relax there. Unfortunately, someone has managed to steal " + -(getgold) + " gold from you unnoticed.  (" + date + ") " );
			return "redirect:/";
		}
	}
	
	@RequestMapping("/reset")
	public String reset (HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
