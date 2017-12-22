package com.duospace.admin.book;

import org.springframework.web.multipart.MultipartFile;

public class Book {
	private int signNum, status;
	private String bookName, writer, publisher, created;
	private String pubDate;
	private int cateNum;
	private String categoryName;
	private String imageName;
	private MultipartFile upload;
	
	public int getSignNum() {
		return signNum;
	}
	public void setSignNum(int signNum) {
		this.signNum = signNum;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public int getCateNum() {
		return cateNum;
	}
	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
}
