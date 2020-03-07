package com.drewadorno.lookify.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.drewadorno.lookify.models.Song;

@Repository 
public interface SongRepo extends JpaRepository<Song, Long> {
	//List<Song> findAll();
	List<Song> findByArtistContaining(String s);
	List <Song> findTop10ByOrderByRatingDesc();
}
