package DaoImplement;

import DaoImplement.DbConnectionImpl;
import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Image;
import java.sql.Connection;
import POJO.Prescription_PDF_Bean;   
import com.sun.scenario.effect.ImageData;
import java.io.FileOutputStream;

public class Prescription_PDF_Dao {

 public String chkinsrt(Prescription_PDF_Bean prescription_PDF_Bean)
    {           
        Connection conn=null;
        
        try {
                conn = DbConnectionImpl.getConnection();
                
                
                
                String ward_no = prescription_PDF_Bean.getWard_no();
                String bed_no = prescription_PDF_Bean.getBed_no();
                String patient_id = prescription_PDF_Bean.getPatient_id();
                String patient_name = prescription_PDF_Bean.getPatient_name();
                String Blood_Pressure = prescription_PDF_Bean.getBlood_Pressure();        
                String Oxygen_Level =prescription_PDF_Bean.getOxygen_Level();
                String Pulse_Rate =prescription_PDF_Bean.getPulse_Rate();
                
                String file_name="C:\\Users\\Lenovo\\Documents\\NetBeansProjects\\Aayu Medical Service\\web\\prescription_pdf\\"+patient_id+".pdf";
                
                Document document=new Document();
                PdfWriter.getInstance(document, new FileOutputStream(file_name));
                document.open();
                
                
                String medicine_name1 =prescription_PDF_Bean.getMedicine_name1();
                String Power1 = prescription_PDF_Bean.getPower1();        
                String Remarks1 = prescription_PDF_Bean.getRemarks1();

                
                String medicine_name2 =prescription_PDF_Bean.getMedicine_name2();
                String Power2 = prescription_PDF_Bean.getPower2();        
                String Remarks2 = prescription_PDF_Bean.getRemarks2();

                
                String medicine_name3 =prescription_PDF_Bean.getMedicine_name3();
                String Power3 = prescription_PDF_Bean.getPower3();        
                String Remarks3 = prescription_PDF_Bean.getRemarks3();

                
                String medicine_name4 =prescription_PDF_Bean.getMedicine_name4();
                String Power4 = prescription_PDF_Bean.getPower4();        
                String Remarks4= prescription_PDF_Bean.getRemarks4();

                
                String medicine_name5 =prescription_PDF_Bean.getMedicine_name5();
                String Power5 = prescription_PDF_Bean.getPower5();        
                String Remarks5 = prescription_PDF_Bean.getRemarks5();

                
                String medicine_name6 =prescription_PDF_Bean.getMedicine_name6();
                String Power6 = prescription_PDF_Bean.getPower6();        
                String Remarks6 = prescription_PDF_Bean.getRemarks6();

                
                String medicine_name7 =prescription_PDF_Bean.getMedicine_name7();
                String Power7 = prescription_PDF_Bean.getPower7();        
                String Remarks7 = prescription_PDF_Bean.getRemarks7();

                
                String medicine_name8 =prescription_PDF_Bean.getMedicine_name8();
                String Power8 = prescription_PDF_Bean.getPower8();        
                String Remarks8 = prescription_PDF_Bean.getRemarks8();

                
                String medicine_name9 =prescription_PDF_Bean.getMedicine_name9();
                String Power9 = prescription_PDF_Bean.getPower9();        
                String Remarks9 = prescription_PDF_Bean.getRemarks9();

               
                String medicine_name10 =prescription_PDF_Bean.getMedicine_name10();
                String Power10 = prescription_PDF_Bean.getPower10();        
                String Remarks10 = prescription_PDF_Bean.getRemarks10();
                
                String test_id1= prescription_PDF_Bean.getTest_id1();
                if(test_id1==null)
                {
                    test_id1="";
                }
                else
                {
                    test_id1=test_id1.concat(", ");
                }
                
                
                String test_id2= prescription_PDF_Bean.getTest_id2();
                if(test_id2==null)
                {
                    test_id2="";
                }
                else
                {
                    test_id2=test_id2.concat(", ");
                }
                String test_id3= prescription_PDF_Bean.getTest_id3();
                if(test_id3==null)
                {
                    test_id3="";
                }
                else
                {
                    test_id3=test_id3.concat(", ");
                }
                String test_id4= prescription_PDF_Bean.getTest_id4();
                if(test_id4==null)
                {
                    test_id4="";
                }
                else
                {
                    test_id4=test_id4.concat(", ");
                }
                String test_id5= prescription_PDF_Bean.getTest_id5();
                if(test_id5==null)
                {
                    test_id5="";
                }
                else
                {
                    test_id5=test_id5.concat(", ");
                }
                String test_id6= prescription_PDF_Bean.getTest_id6();
                if(test_id6==null)
                {
                    test_id6="";
                }
                else
                {
                    test_id6=test_id6.concat(", ");
                }
                String test_id7= prescription_PDF_Bean.getTest_id7();
                if(test_id7==null)
                {
                    test_id7="";
                }
                else
                {
                    test_id7=test_id7.concat(", ");
                }
                String test_id8 = prescription_PDF_Bean.getTest_id8();
                if(test_id8==null)
                {
                    test_id8="";
                }
                else
                {
                    test_id8=test_id8.concat(", ");
                }
                
                String aayu_logo = "C:\\Users\\Lenovo\\Documents\\NetBeansProjects\\Aayu Medical Service\\web\\images\\logo.png";
                Image aayu_logo_image = Image.getInstance(aayu_logo);
                
                aayu_logo_image.setAlignment(Image.ALIGN_CENTER);
                
                PdfPTable medicine_table = new PdfPTable(3);
                
                PdfPCell table_cell;
                
                
                PdfPTable ward_bed_table = new PdfPTable(2);
                
                PdfPCell ward_bed;
                
                
                PdfPTable patient_id_name_table = new PdfPTable(2);
                
                PdfPCell patient_id_name;
                
                
                PdfPTable Observation_table = new PdfPTable(3);
                
                PdfPCell Observation;
                
                
                System.out.println(prescription_PDF_Bean.toString());
                
                ward_bed=new PdfPCell(new Phrase("Ward No : "+ward_no));
                ward_bed_table.addCell(ward_bed);
                ward_bed=new PdfPCell(new Phrase("Bed No : "+bed_no));
                ward_bed_table.addCell(ward_bed);
                                
                patient_id_name=new PdfPCell(new Phrase("Patient ID :   "+patient_id));
                patient_id_name_table.addCell(patient_id_name);
                patient_id_name=new PdfPCell(new Phrase("Patient Name : "+patient_name));
                patient_id_name_table.addCell(patient_id_name);

                Observation=new PdfPCell(new Phrase("Blood Pressure :   "+Blood_Pressure));
                Observation_table.addCell(Observation);
                Observation=new PdfPCell(new Phrase("Oxygen Level : "+Oxygen_Level));
                Observation_table.addCell(Observation);
                Observation=new PdfPCell(new Phrase("Pulse Rate : "+Pulse_Rate ));
                Observation_table.addCell(Observation);
                
                
                table_cell=new PdfPCell(new Phrase("Medicine Name"));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase("Power"));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase("Remarks"));
                medicine_table.addCell(table_cell);
                
                table_cell=new PdfPCell(new Phrase(medicine_name1));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Power1));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Remarks1));
                medicine_table.addCell(table_cell);
                
                table_cell=new PdfPCell(new Phrase(medicine_name2));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Power2));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Remarks2));
                medicine_table.addCell(table_cell);
                
                table_cell=new PdfPCell(new Phrase(medicine_name3));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Power3));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Remarks3));
                medicine_table.addCell(table_cell);
                
                table_cell=new PdfPCell(new Phrase(medicine_name4));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Power4));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Remarks4));
                medicine_table.addCell(table_cell);
                
                table_cell=new PdfPCell(new Phrase(medicine_name5));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Power5));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Remarks5));
                medicine_table.addCell(table_cell);
                
                table_cell=new PdfPCell(new Phrase(medicine_name6));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Power6));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Remarks6));
                medicine_table.addCell(table_cell);

                table_cell=new PdfPCell(new Phrase(medicine_name7));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Power7));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Remarks7));
                medicine_table.addCell(table_cell);
                
                table_cell=new PdfPCell(new Phrase(medicine_name8));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Power8));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Remarks8));
                medicine_table.addCell(table_cell);
                
                table_cell=new PdfPCell(new Phrase(medicine_name9));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Power9));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Remarks9));
                medicine_table.addCell(table_cell);
                
                table_cell=new PdfPCell(new Phrase(medicine_name10));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Power10));
                medicine_table.addCell(table_cell);
                table_cell=new PdfPCell(new Phrase(Remarks10));
                medicine_table.addCell(table_cell);
                
//                Paragraph para1 = new Paragraph("           AAYU MEDICAL SEVICE         ");
                
                Paragraph para15 = new Paragraph(  " DIAGONOSTIC  :     " +  test_id1 +  test_id2  +  test_id3 +  test_id4 +  test_id5 + test_id6  +  test_id7  +  test_id8 );
                
                System.out.println(para15);
                
                document.add(aayu_logo_image);
//                document.add(para1);
                document.add(new Paragraph(" "));
                document.add(new Paragraph(" "));
                document.add(ward_bed_table);
                document.add(new Paragraph(" "));
                document.add(patient_id_name_table);
                document.add(new Paragraph(" "));
                document.add(Observation_table);
                document.add(new Paragraph(" "));
                document.add(new Paragraph(" "));
                document.add(medicine_table); 
                document.add(new Paragraph(" "));
                document.add(para15);
                document.add(new Paragraph(" "));
                document.addTitle(patient_id);
                
                document.close();
                System.out.println("pdf Created");
                
                conn.close();
                return "SUCCESS";
            }catch(Exception e) {
            e.printStackTrace();
            }
            return "FAIL INSERT";
    }
}
