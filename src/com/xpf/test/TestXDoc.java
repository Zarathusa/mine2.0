package com.xpf.test;

import java.io.File;
import java.io.IOException;

import org.junit.Test;

import com.xpf.util.XDocService;

public class TestXDoc {

	@Test
	public void test1(){
		XDocService service = new XDocService();
		try {
		    service.to("C:/Users/admin/Desktop/夏鹏飞-研发笔试题目-V5.0.docx", new File("C:/Users/admin/Desktop/夏鹏飞-研发笔试题目-V5.0.docx.pdf"));
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}
	
	@Test
	public void test2(){
		String s="1111.pdf";
		boolean b = s.endsWith(".pdf");
		System.out.println(b);
	}
}
