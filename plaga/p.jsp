<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,java.lang.*" %>

<%!
String line = "", str = "";
int num_words = 0;
int num_lines = 0;
%>

<html>
<%
int i=0,j=0;
double count=0;
double report=0;
String my = "/home/jenit/";
String f = request.getParameter("myFile");
String inputfile = my+f;

out.println("File Selected : "+inputfile);
out.println("<br><br>");

String datafile = "/home/jenit/a.txt";
out.println("Database File : "+datafile);
out.println("<br>");

filedetails(datafile);

out.println("<br>");
out.println("Number of Lines in Database File : "+num_lines);

out.println("<br>");
out.println("Number of Words in Database File : "+num_words);

out.println("<br>");
out.println("Contents of Database File : "+str);
String datawords[] = str.split(" ");

filedetails(inputfile);

out.println("<br><br>");
out.println("Number of Lines in Input File : "+num_lines);

out.println("<br>");
out.println("Number of Words in Input File : "+num_words);


out.println("<br>");
out.println("Contents of Input File : "+str);
String inputwords[] = str.split(" ");
out.println("<br><br>");
	
	for(i=0;i<=datawords.length-1;i++)
	{
		for(j=0;j<=inputwords.length-1;j++)
		{
			if((datawords[i]).equals(inputwords[j]))
			{
			count++;
			}
		}
	}

report = (count / num_words) * 100;

	if(report>=60.0)
	{
	out.println("Plagiarism Report : "+report+"%");
	out.println("<br><br>");
	out.println("OOPS, REPORT IS PLAGIARISED.....");
	}
	
	else
	{
	out.println("<br><br>");
	report =100-report;
	out.println(report+"%"+" UNIQUE REPORT......");
	}
%>
</html>

<%!
void filedetails(String filepath)throws IOException{

num_words = 0;
num_lines = 0;
line = "";
str = "";

FileReader fr = new FileReader(filepath);
BufferedReader br = new BufferedReader(fr);

	while ((line = br.readLine()) != null) {
	str += line + " ";
	num_lines++;
	}
  
StringTokenizer st = new StringTokenizer(str);

	while (st.hasMoreTokens()) {
	st.nextToken();
	num_words++;
	}

}
%>


