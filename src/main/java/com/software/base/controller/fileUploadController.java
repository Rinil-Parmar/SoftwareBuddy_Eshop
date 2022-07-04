package com.software.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.software.base.helper.fileUploadHelper;

@RestController
public class fileUploadController {
	
	@Autowired
	private fileUploadHelper fuh;
	
//	@PostMapping("/upload-file")
//	public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file){
//		
//		boolean f = fuh.uploadFile(file);
//		if (f) {
//			return ResponseEntity.ok("success");
//		}
//		
//		return null;
//	}
}
