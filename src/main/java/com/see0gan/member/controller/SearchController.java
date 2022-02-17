package com.see0gan.member.controller;

import java.net.URI;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.see0gan.member.model.Space;
import com.see0gan.member.service.SpaceService;

@RestController
@RequestMapping(path = "/api/spaces")
public class SearchController {

	Logger logger = LoggerFactory.getLogger(SearchController.class);

	private SpaceService spaceService;
	private ObjectMapper objectMapper;

	public SearchController(SpaceService spaceService, ObjectMapper objectMapper) {
		this.spaceService = spaceService;
		this.objectMapper = objectMapper;
	}

	@GetMapping
	public ResponseEntity<?> getResult(@RequestParam(required = false) String type) {

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.set("Content-Type", "application/json;charset=UTF-8");

		if (type == null) {
			return ResponseEntity.ok().headers(responseHeaders).body(spaceService.getAllSpaces());
		}

		else if (type.equals("party") || type.equals("practice") || type.equals("studio")
				|| type.equals("conference")) {

			List<Space> result = spaceService.getSpaceByType(type);

			try {

				String spaceList = objectMapper.writeValueAsString(result);

				return ResponseEntity.ok().headers(responseHeaders).body(spaceList);
			} catch (Exception e) {
				logger.debug("error {}", e.getMessage());

			}

		}
		return ResponseEntity.badRequest().headers(responseHeaders).body("Wrong type value");
	}

	@GetMapping(path = "/{spaceId}")
	public ResponseEntity<?> fetchSpaceById(@PathVariable("spaceId") String spaceId) {

		return ResponseEntity.ok(spaceService.getSpaceById(spaceId));

	}

	@PostMapping
	public ResponseEntity<?> registerSpace(@RequestBody Space space) {

		URI uri = URI.create(ServletUriComponentsBuilder.fromCurrentContextPath().path("api/spaces").toUriString());
		Long id = spaceService.addSpace(space);

		return ResponseEntity.created(uri).body("Space #" + id + "has been created successfully");

	}

	@DeleteMapping(path = "/{spaceId}")
	public ResponseEntity<?> deleteSpace(@PathVariable("spaceId") String spaceId) {

		return ResponseEntity.ok(spaceService.deleteSpace(spaceId));

	}

	@PutMapping(path = "/{spaceId}")
	public ResponseEntity<?> updateSpace(@PathVariable("spaceId") Long spaceId, @RequestBody Space space) {
		try {
			space.setId(spaceId);
			return ResponseEntity.ok(spaceService.updateSpaceById(spaceId, space));
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("error-message : " + e.getMessage());
		}
	}

}
