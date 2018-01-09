import java.io.IOException;
import java.io.OutputStream; // to write the PDF
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.pdf.RandomAccessFileOrArray;//hold user uploaded Tiff File
import com.itextpdf.text.pdf.codec.TiffImage; // Read Tiff file for Processing
import com.itextpdf.text.Image; //Extract images from Tiff File
import com.itextpdf.text.pdf.PdfWriter; // write PDF 
import com.itextpdf.text.Document;//Logical PDF object
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.DocumentException;
import com.oreilly.servlet.MultipartRequest;//To save uploaded Tiff file for processing
public class test extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        try (OutputStream out = response.getOutputStream() //Return PDF back to browser
        ) {
            //Save uploaded Tiff file to server
            MultipartRequest myrequest=new MultipartRequest(request,"c:\\test");            
            //Create Document object
            Document document = new Document();            
            // Create PdfWriter instance to response output stream
            PdfWriter.getInstance(document, out);
            //Open Document Object
            document.open();
//            document.add(new Paragraph("Welcome, Your Input Image is Converted to PDF, Save the File"));
//            document.add(new Paragraph("PDF Produced by Converting Image to PDF as Servlet"));            
            //Get uploaded image path in string variable
//            String conversionType=myrequest.getParameter("convertTo");
//            System.out.println(conversionType);
            String FilePath=myrequest.getFile("file").getAbsolutePath();
            //Check if the User has opted for Tiff2Pdf at the page
//            if (conversionType.equals("Tiff2Pdf")){
//            //Start readig the Tiff image 
//            RandomAccessFileOrArray myTiffFile=new RandomAccessFileOrArray(FilePath);
//            //Get number of pages
//            int numberOfPages=TiffImage.getNumberOfPages(myTiffFile);
//            //Extract each page and add to Document
//            for(int i=1;i<=numberOfPages;i++){
//            Image tempImage=TiffImage.getTiffImage(myTiffFile, i);
//            document.add(tempImage);
//            }
//            }
//            //Check if the User has opted for Jpeg2Pdf at the page
//            if (conversionType.equals("Jpeg2Pdf")){
               Image tempImage=Image.getInstance(FilePath);
               tempImage.scaleToFit(640, 480);
               document.add(tempImage);
//            }
            document.close();
                       
        }  catch (DocumentException exc){
                throw new IOException(exc.getMessage());
                }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// 
}