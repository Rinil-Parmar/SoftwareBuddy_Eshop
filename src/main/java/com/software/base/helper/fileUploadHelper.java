package com.software.base.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class fileUploadHelper {
	public final String UPLOAD_DIR = "C:\\Users\\Rinil Parmar\\Downloads\\Lab_9-12_spring_hibernate_project\\AccountingProject_SEM4\\src\\main\\resources\\static\\images";
//	public final String UPLOAD_DIR = new ClassPathResource("static/images").getFile().getAbsolutePath();
	
	
	public fileUploadHelper() throws IOException {
		super();
		// TODO Auto-generated constructor stub
	}



	public boolean uploadFile(MultipartFile mlt) {
		boolean f = false;
		
		try {
			
			Files.copy(mlt.getInputStream(), Paths.get(UPLOAD_DIR + File.separator + mlt.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
			
			f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
}
