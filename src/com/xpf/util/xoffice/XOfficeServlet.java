package com.xpf.util.xoffice;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.net.URL;
import java.security.MessageDigest;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacob.com.ComThread;

/**
 * OfficeServlet
 * 
 * @author wanghg
 */
public class XOfficeServlet extends HttpServlet {
	private static final long serialVersionUID = 280698472747919447L;
	private static Logger logger = Logger.getLogger(XOfficeServlet.class.getName());
	private String key = null;
	public void init() throws ServletException {
		super.init();
		this.key = nvl(this.getInitParameter("key"), "");
		try {
			ComThread.InitMTA();
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage(), e);
		}
		logger.info("Office Servlet " + Version.version + " Init!");
	}
		
	private String nvl(String str, String def) {
		return str != null ? str : def;
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		doAct(request, response, false);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		doAct(request, response, true);
	}
	public void doAct(HttpServletRequest request, HttpServletResponse response, boolean post)
			throws IOException {
		String reqkey = nvl(request.getParameter("_key"), "");
		if (!reqkey.equals(this.key)) {
			logger.info("Invalid '_key'!");
			return;
		}
		String format = request.getHeader("_xformat");
		if (format == null) {
			format = request.getParameter("_xformat");
		}
		if (format == null) {
			logger.info("No Paramater '_xformat'!");
			return;
		}
		String urlFile = null;
		if (!post) {
			urlFile = request.getParameter("_file");
			if (urlFile == null) {
				logger.info("No Paramater '_file'!");
				return;
			}
		}
		long s = System.currentTimeMillis();
		logger.info("Convert start...");			
		String fileName = System.getProperty("java.io.tmpdir");
		if (!fileName.endsWith("/") && !fileName.endsWith("\\")) {
			fileName += "/";
		}
		InputStream in = null;
		OutputStream out = null;
		try {
			File src, tar;
			if (post) {
				fileName += UUID.randomUUID().toString();
				src = new File(fileName + "." + format);
				tar = new File(fileName + ".pdf");
				in = request.getInputStream();
				out = new FileOutputStream(src);
				XOfficeServlet.pipe(in, out);
			} else {
		    	MessageDigest m = MessageDigest.getInstance("MD5");
		    	m.update(urlFile.getBytes("utf-8"));
				fileName += new BigInteger(1, m.digest()).toString(16);
				src = new File(fileName + "." + format);
				tar = new File(fileName + ".pdf");
				if (!src.exists()) {
					logger.info("Read:" + urlFile + "...");
					in = new URL(urlFile).openStream();
					out = new FileOutputStream(src);
					XOfficeServlet.pipe(in, out);
				} else {
					logger.info("Cache:" + src.getAbsolutePath());
				}
			}
			if (!tar.exists()) {
				logger.info(src.getAbsolutePath() + " >>> " + tar.getAbsolutePath());
				if (format.startsWith("doc")) {
					WordApp.toPdf(src.getAbsolutePath(), tar.getAbsolutePath());
				} else if (format.startsWith("xls")) {
					ExcelApp.toPdf(src.getAbsolutePath(), tar.getAbsolutePath());
				} else if (format.startsWith("ppt")) {
					PowerPointApp.toPdf(src.getAbsolutePath(), tar.getAbsolutePath());
				}
			} else {
				logger.info("Cache:" + tar.getAbsolutePath());
			}
			response.setHeader("Content-Disposition", "filename=\"" + tar.getName() + "\"");
			response.setContentType("application/pdf");
			out = response.getOutputStream();
			in = new FileInputStream(tar);
			String watermark = request.getParameter("_watermark");
			if (watermark != null && watermark.trim().length() > 0) {
				PdfUtil.addWatermark(in, out, watermark);
			} else {
				XOfficeServlet.pipe(in, out);
			}
		} catch (Throwable t) {
			response.setStatus(500);
			logger.log(Level.SEVERE, t.getMessage(), t);
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (Exception e) {
				}
			}
			if (out != null) {
				try {
					out.close();
				} catch (Exception e) {
				}
			}
		}
		logger.info("Convert stop,Use " + (System.currentTimeMillis() - s) + " ms!");
	}
	private static void pipe(InputStream in, OutputStream out)
			throws IOException {
		int len;
		byte[] buf = new byte[4096];
		while (true) {
			len = in.read(buf);
			if (len > 0) {
				out.write(buf, 0, len);
			} else {
				break;
			}
		}
		in.close();
		out.flush();
		out.close();
	}
}
