package com.see0gan.member.service;

import java.util.List;

import com.see0gan.member.model.Space;

public interface SpaceService {

	public List<Space> getSpaceByType(String type);
	public List<Space> getAllSpaces();
	public Space getSpaceById(String spaceId);
	public Long addSpace(Space space);
	public int updateSpaceById(Long id, Space space);
	public int deleteSpace(String spaceId);
}
