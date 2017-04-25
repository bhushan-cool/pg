import java.io.*;  
import java.net.*; 
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException; 
public class server 
{  
	public static void main(String[] args)
	{  
    		try
		{  
    			ServerSocket ss=new ServerSocket(6666);  
    			Socket s=ss.accept();//establishes connection   
    			DataInputStream dis=new DataInputStream(s.getInputStream());  
    			String  str=(String)dis.readUTF(); 
			String  hash=(String)dis.readUTF();  
    			System.out.println("message= "+str); 
			//System.out.println("Server Side Hash Value = "+hash);  
    			System.out.println("Server Side Hash Value = "+sha1(str));
			String cmp=sha1(str);
			System.out.println("Authentication =");
			System.out.println(cmp.equals(hash));//true  
    			ss.close();  
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
