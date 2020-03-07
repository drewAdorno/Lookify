package com.drewadorno.lookify.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.drewadorno.lookify.models.Song;
import com.drewadorno.lookify.repositories.SongRepo;

@Service 
public class SongService {
	private final SongRepo songRepo;
	
	public SongService(SongRepo songRepo)
	{
		this.songRepo=songRepo;
	}
	//read all
	public List<Song> allSongs()
	{
		return songRepo.findAll();
	}
	//read one
	public Song getSong(Long id)
	{
		return songRepo.findById(id).get();
	}	
	//add
	public Song addSong(Song s)
	{
		return songRepo.save(s);
	}
	//update
	public Song updateSong(Song s)
	{
		return songRepo.save(s);
	}
	//delete
	public void delete(Long id)
	{
		songRepo.deleteById(id);
	}
	public List<Song> search(String s)
	{
		return songRepo.findByArtistContaining(s);
	}
	public List<Song> topTen()
	{
		return songRepo.findTop10ByOrderByRatingDesc();
	}
}
