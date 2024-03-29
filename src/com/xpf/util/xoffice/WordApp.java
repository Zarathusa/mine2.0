package com.xpf.util.xoffice;

import java.util.logging.Level;
import java.util.logging.Logger;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

/**
 * WordApp
 * @author wanghg
 */
public class WordApp {
	private static Logger logger = Logger.getLogger(WordApp.class.getName());
	public static void toPdf(String src, String tar) {
		ActiveXComponent app = null;
		Dispatch doc = null;
		try {
			app = new ActiveXComponent("Word.Application");
			app.setProperty("Visible", new Variant(false));
			app.setProperty("AutomationSecurity", new Variant(3));
			Dispatch docs = app.getProperty("Documents").toDispatch();
			doc = Dispatch.call(docs, "Open",
					new Object[] { src, Boolean.FALSE, Boolean.TRUE })
					.toDispatch();
			Dispatch.call(doc, "SaveAs",
					new Object[] { tar, Integer.valueOf(17) });
		} catch (Throwable t) {
			logger.log(Level.SEVERE, t.getMessage(), t);
		} finally {
			if (doc != null) {
				try {
					Dispatch.call(doc, "Close", new Object[] { Boolean.FALSE });
				} catch (Throwable t) {
					logger.log(Level.SEVERE, t.getMessage(), t);
				}
			}
			if (app != null) {
				try {
					app.invoke("Quit", new Variant[] {new Variant(false)});
					app.safeRelease();
				} catch (Throwable t) {
					logger.log(Level.SEVERE, t.getMessage(), t);
				}
			}

		}
	}
}
