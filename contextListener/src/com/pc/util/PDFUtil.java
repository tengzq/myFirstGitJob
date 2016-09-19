package com.pc.util;

import java.io.File;  
import java.io.FileOutputStream;  
import java.io.OutputStream;
import java.util.List;
  
import com.lowagie.text.Document;  
import com.lowagie.text.Element;  
import com.lowagie.text.Font;  
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;  
import com.lowagie.text.Phrase;  
import com.lowagie.text.pdf.BaseFont;  
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPCell;  
import com.lowagie.text.pdf.PdfPTable;  
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfStamper;
import com.lowagie.text.pdf.PdfWriter;  

public class PDFUtil { 
    Document document = new Document();// 建立一个Document对象      
      
    @SuppressWarnings("unused")
	private static Font headfont ;// 设置字体大小  
    private static Font keyfont;// 设置字体大小  
    private static Font textfont;// 设置字体大小  
      
  
      
    static{  
        BaseFont bfChinese;  
        try {  
            //bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);  
            bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);  
            headfont = new Font(bfChinese, 10, Font.BOLD);// 设置字体大小  
            keyfont = new Font(bfChinese, 8, Font.BOLD);// 设置字体大小  
            textfont = new Font(bfChinese, 8, Font.NORMAL);// 设置字体大小  
        } catch (Exception e) {           
            e.printStackTrace();  
        }   
    }   
      
      
    public PDFUtil(File file) {          
         document.setPageSize(PageSize.A4);// 设置页面大小  
         try {  
            PdfWriter.getInstance(document,new FileOutputStream(file));  
            document.open();   
        } catch (Exception e) {  
            e.printStackTrace();  
        }   
          
          
    }  
    int maxWidth = 520;  
      
      
     public PdfPCell createCell(String value,com.lowagie.text.Font font,int align){  
         PdfPCell cell = new PdfPCell();  
         cell.setVerticalAlignment(Element.ALIGN_MIDDLE);          
         cell.setHorizontalAlignment(align);      
         cell.setPhrase(new Phrase(value,font));  
        return cell;  
    }  
      
     public PdfPCell createCell(String value,com.lowagie.text.Font font){  
         PdfPCell cell = new PdfPCell();  
         cell.setVerticalAlignment(Element.ALIGN_MIDDLE);  
         cell.setHorizontalAlignment(Element.ALIGN_CENTER);   
         cell.setPhrase(new Phrase(value,font));  
        return cell;  
    }  
  
     public PdfPCell createCell(String value,com.lowagie.text.Font font,int align,int colspan){  
         PdfPCell cell = new PdfPCell();  
         cell.setVerticalAlignment(Element.ALIGN_MIDDLE);  
         cell.setHorizontalAlignment(align);      
         cell.setColspan(colspan);  
         cell.setPhrase(new Phrase(value,font));  
        return cell;  
    }  
    public PdfPCell createCell(String value,com.lowagie.text.Font font,int align,int colspan,boolean boderFlag){  
         PdfPCell cell = new PdfPCell();  
         cell.setVerticalAlignment(Element.ALIGN_MIDDLE);  
         cell.setHorizontalAlignment(align);      
         cell.setColspan(colspan);  
         cell.setPhrase(new Phrase(value,font));  
         cell.setPadding(3.0f);  
         if(!boderFlag){  
             cell.setBorder(0);  
             cell.setPaddingTop(15.0f);  
             cell.setPaddingBottom(8.0f);  
         }  
        return cell;  
    }  
     public PdfPTable createTable(int colNumber){  
        PdfPTable table = new PdfPTable(colNumber);  
        try{  
            table.setTotalWidth(maxWidth);  
            table.setLockedWidth(true);  
            table.setHorizontalAlignment(Element.ALIGN_CENTER);       
            table.getDefaultCell().setBorder(1);  
        }catch(Exception e){  
            e.printStackTrace();  
        }  
        return table;  
    }  
     public PdfPTable createTable(float[] widths){  
            PdfPTable table = new PdfPTable(widths);  
            try{  
                table.setTotalWidth(maxWidth);  
                table.setLockedWidth(true);  
                table.setHorizontalAlignment(Element.ALIGN_CENTER);       
                table.getDefaultCell().setBorder(1);  
            }catch(Exception e){  
                e.printStackTrace();  
            }  
            return table;  
        }  
      
     public PdfPTable createBlankTable(){  
         PdfPTable table = new PdfPTable(1);  
         table.getDefaultCell().setBorder(0);  
         table.addCell(createCell("", keyfont));           
         table.setSpacingAfter(20.0f);  
         table.setSpacingBefore(20.0f);  
         return table;  
     }  
       
     //生成投资合同的PDF
     public void generateContractPDF(List<PageData> list,String filePath,String password) throws Exception{  
         
    	 OutputStream file = new FileOutputStream(new File(filePath));
    	 PdfWriter writer = PdfWriter.getInstance(document, file);
         writer.setEncryption(password.getBytes(), "Owner123".getBytes(),
                1, PdfWriter.ENCRYPTION_AES_128); 
        document.open();
        PdfPTable table = createTable(2);  
        table.addCell(createCell("还款计划列表：", keyfont,Element.ALIGN_LEFT,4,false));  
              
        table.addCell(createCell("还款日期", keyfont, Element.ALIGN_CENTER));  
        table.addCell(createCell("还款金额", keyfont, Element.ALIGN_CENTER));  
          
        for(PageData p:list){  
        	String dateStr = DateUtil.strDateStr(p.get("REPAYMENT_DATE")+"");
            table.addCell(createCell(dateStr, textfont));  
            table.addCell(createCell(p.get("CAPITAL")+"元", textfont));  
        }  
        document.add(table);  
        document.close();  
        file.close();
     }  
     
     private static void waterMark(String inputFile,  String userPassWord) {  
    	 try {
    		 
             OutputStream file = new FileOutputStream(new File("D:\\Test.pdf"));
  
             Document document = new Document();
             PdfWriter writer = PdfWriter.getInstance(document, file);
             writer.setEncryption(userPassWord.getBytes(), "Owner123".getBytes(),
                    1, PdfWriter.ENCRYPTION_AES_128);
  
             document.open();
            // document.add(new Paragraph("Hello World, iText"));
            // document.add(new Paragraph(new Date().toString()));
  
             document.close();
             file.close();
  
         } catch (Exception e) {
  
             e.printStackTrace();
         }
     }  
       
     public static void main(String[] args) throws Exception {  
         File file = new File("D:\\text1.pdf");  
         file.createNewFile();  
         //waterMark("D:\\text1.pdf","D:\\text1.pdf","111","222","",16);
        //new PDFUtil(file).generatePDF();  
         waterMark("","");
    }  
      
      
}  