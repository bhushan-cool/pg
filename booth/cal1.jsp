<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.io.IOException"%>
<html>
<title>result page</title>
<body bgcolor="red">
<form action="index.html" method="get">
<br><br><font color="blue">

<%!
int m[]= new int [4];
int q[]= new int [4];
int Q1=0;
int count=4;
int m1[]= new int [4];
int d1,d2;
%>

<%
d1=Integer.parseInt(request.getParameter("num1"));
d2=Integer.parseInt(request.getParameter("num2"));
%>

<%
	if(d1>=0 && d2>=0)
	{
	decimal_to_binary_pos(d1,d2);
	}

	else
	{
	decimal_to_binary_neg(d1,d2); 
	}
%>

<%!
void decimal_to_binary_neg(int d1,int d2)
{
	if(d1<=-1 && d2>=0) 
	{
		d1=d1*(-1);
		decimal_to_binary_pos(d1,d2);
		int mcomp[]=comp(m);
	
		for(int i=0;i<=3;i++)
		{
			m[i]=mcomp[i];		
		}
	}
	
	if(d1>=0 && d2<=-1) 
	{
		d2=d2*(-1);
		decimal_to_binary_pos(d1,d2);
		int qcomp[]=comp(q);
	
		for(int i=0;i<=3;i++)
		{
			q[i]=qcomp[i];		
		}
	}

	if(d1<=-1 && d2<=-1) 
	{
		d1=d1*(-1);
		d2=d2*(-1);
		decimal_to_binary_pos(d1,d2);
		int mcomp[]=comp(m);
		int qcomp[]=comp(q);
	
		for(int i=0;i<=3;i++)
		{
			m[i]=mcomp[i];
			q[i]=qcomp[i];		
		}
	}
			
}
%>

<%!
void decimal_to_binary_pos(int d1,int d2)
{
int rem,i=1,sum=0,j=1,total=0;

    	do
    	{
        rem=d1%2;
        sum=sum + (i*rem);
        d1=d1/2;
        i=i*10;
    	}while(d1>0);

		for(i=3;i>=0;i--)
		{
		m[i]=sum%10;
		sum=sum/10;
		}

   
    	do
    	{
        rem=d2%2;
        total=total + (j*rem);
        d2=d2/2;
        j=j*10;
    	}while(d2>0);
   
	
		for(i=3;i>=0;i--)
		{
		q[i]=total%10;
		total=total/10;
		}
		
}	
%>

<%
out.println("&nbsp;&nbsp;");
out.println("A &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
out.print("Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Q-1 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
out.print("M &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Operation &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
int a[]={0,0,0,0};
display(out,a,q,Q1,m);

out.print("&nbsp;Initial");
out.print("<br>");

	for(int i=count;i>0;i--)
	{
		for(int j=0;j<=3;j++)
		{
		m1[j]=m[j];
		}
		
		if(q[3]==0 && Q1==1)
		{	
		a=add(a,m1);
		display(out,a,q,Q1,m);
		out.print("A<~A+M");
		out.print("<br>");
		}
		
		if((q[3]==1&&Q1==1)||(q[3]==0&&Q1==0))
		{ }
		
		if(q[3]==1&&Q1==0)
		{
		int c[]=comp(m1);
		a=add(a,c);
		display(out,a,q,Q1,m);
		out.print("A<~A-M");
		out.print("<br>");
		}
	
		Q1=q[3];
		shift(a,q);
		display(out,a,q,Q1,m);
		out.print("shift");
		out.println("<br>");
	}
%>

<%!
int[] add(int a[],int m1[])
{
int carry=0;
int sum[]=new int [4];

	for(int i=3;i>=0;i--)
	{
	sum[i]=(a[i]+m1[i]+carry)%2;
	carry=(a[i]+m1[i]+carry)/2;
	}

return sum;
}
%>

<%!
void shift(int a[],int q[])
{
int b=a[3];

	for(int i=2;i>=0;i--)
	{
	a[i+1]=a[i];
	q[i+1]=q[i];
	}

q[0]=b;
}
%>

<%!
int[] comp(int m1[])
{
int z[]={0,0,0,1};

	for(int i=0;i<=3;i++)	
	{
		if(m1[i]==0)
			m1[i]=1;
		else
			m1[i]=0;
	}
	
int c[]=add(m1,z);
return c;
}
%>

<%!
void display(JspWriter out,int a[],int q[],int Q1,int m[])throws IOException
{
out.print("<br><br>");

	for(int i=0;i<=3;i++)
	{
	out.print(a[i]);
	}

	out.print("&nbsp;&nbsp;&nbsp;&nbsp;");

	for(int i=0;i<=3;i++)
	{
	out.print(q[i]);
	}

out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
out.print(Q1);
out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");

	for(int i=0;i<=3;i++)
	{
	out.print(m[i]);
	}

out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
}
%>

</font>
<br>
<br>
<input type="submit" value="BACK">
</form>
</body>
</html>

