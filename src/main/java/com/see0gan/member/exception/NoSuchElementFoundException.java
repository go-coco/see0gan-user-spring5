package com.see0gan.member.exception;

public class NoSuchElementFoundException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	
	public NoSuchElementFoundException() {
		super();
	}
	
	public NoSuchElementFoundException(String msg) {
		super(msg);
	}
	
	
}
