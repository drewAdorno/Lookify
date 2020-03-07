package com.drewadorno.lookify.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.drewadorno.lookify.models.Song;
import com.drewadorno.lookify.services.SongService;

@Controller
public class HomeController {
	private SongService songService;

	public HomeController(SongService songService)
	{
		this.songService = songService;
	}
	
	@RequestMapping("/")
	public String index()
	{
		return "index.jsp";
	}
	@RequestMapping("/dashboard")
	public String dashboard(Model model)
	{
		model.addAttribute("songs", songService.allSongs());
		return "dashboard.jsp";
	}
	
	@RequestMapping("/songs/{id}")
	public String songPage(@PathVariable("id") Long id, Model model)
	{
		model.addAttribute("song",songService.getSong(id));
		return "songPage.jsp";
	}
	
	@RequestMapping("/songs/new")
	public String newSong(@ModelAttribute("song") Song s)
	{
		return "addSong.jsp";
	}
	
	@PostMapping("/songs/new")
	public String addSong(@Valid @ModelAttribute("song") Song s, BindingResult result)
	{
		if(result.hasErrors())
		{
			return "addSong.jsp";
		}
		else
		{
			songService.addSong(s);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping("/songs/delete/{id}")
	public String delete(@PathVariable("id") Long id)
	{
		songService.delete(id);
		return "redirect:/dashboard";
	}
	
	@PostMapping("/search")
	public String search(@RequestParam(value="title") String s)
	{	
		return "redirect:/search/"+s;
	}
	
	@RequestMapping("/search/{string}")
	public String displaySearch(@PathVariable("string") String s, Model model)
	{
		model.addAttribute("songs", songService.search(s));
		model.addAttribute("song", s);
		return "search.jsp";
	}
	
	
	@RequestMapping("/search/topTen")
	public String top10(Model model)
	{
		model.addAttribute("songs", songService.topTen());
		return "topTen.jsp";
	}
	
	
	
	
	
}
