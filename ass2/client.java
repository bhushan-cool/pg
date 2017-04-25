import java.io.*;  
import java.net.*;  
import java.util.Scanner;  
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class client 
{  
	public static void main(String[] args) 
	{  
		try
		{      
			Socket s=new Socket("localhost",6666);  
			DataOutputStream dout=new DataOutputStream(s.getOutputStream());  
			Scanner sc=new Scanner(System.in);
			
			String str=sc.nextLine();
    			System.out.println("Client side Hash Value="+sha1(str));
    			String hash=sha1(str);
			
			dout.writeUTF(str);  
			dout.writeUTF(hash);
			dout.flush();  
			dout.close();  
			s.close();  
		}
		catch(Exception e)
		{
			System.out.println(e);
		}  
	}
	
	static String sha1(String input) throws NoSuchAlgorithmException 
	{
		MessageDigest mDigest = MessageDigest.getInstance("SHA1");
		byte[] result = mDigest.digest(input.getBytes());
		StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < result.length; i++) 
		{
		            sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
	        }
	        return sb.toString();
	}  
}  

