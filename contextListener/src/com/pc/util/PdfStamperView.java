package com.pc.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfStamperView;

import com.lowagie.text.pdf.PdfStamper;

public class PdfStamperView extends AbstractPdfStamperView {

	@Override
	protected void mergePdfDocument(Map<String, Object> arg0, PdfStamper arg1,
			HttpServletRequest arg2, HttpServletResponse arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
