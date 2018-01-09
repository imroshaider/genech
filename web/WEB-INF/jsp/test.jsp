<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Convert Uploaded Image into PDF</title>
    </head>
    <body>
  <h1>Upload a Tiff or JPEG Image which will be Converted to PDF File</h1>        
  <form action="test" method="post" enctype="multipart/form-data" name="uploadImage" id="uploadImage">  
  <input type="file" name="file" id="file">
  <select name="convertTo">
      <option>Tiff2Pdf</option>
      <option>Jpeg2Pdf</option>
  </select>
  <input type="submit" name="Submit" value="Submit">
  </form>
    </body>
</html>