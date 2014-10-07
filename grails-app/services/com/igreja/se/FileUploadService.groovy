package com.igreja.se

import grails.transaction.Transactional

import org.springframework.web.multipart.MultipartFile
import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH

@Transactional
class FileUploadService {

    boolean transactional = true

    def String uploadFile(MultipartFile file,
      String name, String destinationDirectory) {
	  
        def servletContext = SCH.servletContext
        def storagePath = servletContext.getRealPath(destinationDirectory)

        // Create storage path directory if it does not exist
        def storagePathDirectory = new File(storagePath)
        if (!storagePathDirectory.exists()) {
            print "CREATING DIRECTORY ${storagePath}: "
            if (storagePathDirectory.mkdirs()) {
                println "SUCCESS"
            } else {
                println "FAILED"
            }
        }

        // Store file
        if (!file.isEmpty()) {
            file.transferTo(new File("${storagePath}/${name}"))
            println "Saved file: ${storagePath}/${name}"
            return "${storagePath}/${name}"

        } else {
            println "File ${file.inspect()} was empty!"
            return null
        }
    }
	  
	  def String getExtensao(file) {
		  println file
		  def pontoIndex = file.lastIndexOf('.')
		  println file[pontoIndex .. file.size()-1]
		  return file[pontoIndex .. file.size()-1]
	  }
	  
	  def boolean isImage(String entryName){
		  entryName = entryName.toLowerCase()
		  return entryName.endsWith(".tif") || entryName.endsWith(".png") ||
			  entryName.endsWith(".gif") || entryName.endsWith(".tiff") ||
			  entryName.endsWith(".jpg") || entryName.endsWith(".jpeg") ||
			  entryName.endsWith(".bmp")
		}
}
