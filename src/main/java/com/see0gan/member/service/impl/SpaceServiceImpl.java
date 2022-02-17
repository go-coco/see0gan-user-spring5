package com.see0gan.member.service.impl;

import java.util.List;
import java.util.Optional;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.member.dao.SpaceDao;
import com.see0gan.member.exception.NoSuchElementFoundException;
import com.see0gan.member.model.Space;
import com.see0gan.member.service.SpaceService;

@Service
@Transactional
public class SpaceServiceImpl implements SpaceService {
	
	private SpaceDao spaceDao;
	
	public SpaceServiceImpl(SpaceDao spaceDao) {
		this.spaceDao = spaceDao;
	}

	public List<Space> getAllSpaces(){
		return spaceDao.getSpaceList();
	}
	
	
	@Override
	public List<Space> getSpaceByType(String type) {
		return spaceDao.getSpaceByType(type);
	}

	@Override
	public Long addSpace(Space space) {
	//	if(space==null) throw new NoSuchElementFoundException("Required request body is missing: Space");
		return spaceDao.addSpace(space);
	}

	@Override
	public Space getSpaceById(String id) {
		Optional<Space> result = 
				spaceDao.getSpaceById(id)
										;
		
		if(result.isPresent())
		return result.get();
		
		else throw new NoSuchElementFoundException("No such space with id");

	}

	@Override
	public int updateSpaceById(Long id, Space space) {
		return spaceDao.updateSpaceById(id, space);
	}

	@Override
	public int deleteSpace(String id) {
		return spaceDao.deleteSpaceById(id);
	}


}
