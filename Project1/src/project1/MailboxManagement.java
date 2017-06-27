package project1;

import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MailboxManagement {
    public MailboxManagement() {
        super();
    }
    
    public void generate_messages(PrintWriter out, HttpServletRequest request, HttpServletResponse response, HttpSession session){
        out.println("<table class=\"container\">");
        
        String user = (String)session.getAttribute("user-email");
        String column_to_check = "";
        if(user.contains("@")){
            column_to_check = "email";   
        }
        else{
            column_to_check = "username";
        }
        
        String query = "SELECT messages.subject, messages.id, messages.status, messages.sender_id_fk FROM messages, mailboxes, people WHERE people."+ column_to_check +" = '"+ user +"' AND people.mailbox_id_fk = mailboxes.id AND messages.mailbox_id_fk = mailboxes.id ";
        Connection con = connect_to_db();
        try{
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                String status = rs.getString("status");
                String subject = rs.getString("subject");
                String sender_id_fk = rs.getString("sender_id_fk");
                String from = get_person_full_name_from_id(sender_id_fk);
                String message_id = rs.getString("id");
                
                out.println("<tr id='"+ message_id +"'>");
                if(status.equals("read")){
                    out.println("<td style=\"color:#FC778B\"> >> </td><td><a href='message_read?message_id="+ message_id +"'>"+ subject +"<br>"+ from +"</a></td><td><div class=\"Button Button--start\" ><button type='button' onclick=delete_message(\""+ message_id +"\")><span>Delete</span></button></div></td>");
                    out.println("");
                }
                else if(status.equals("unread")){
                    out.println("<td style=\"color:#FC778B\"><b>New</b></td><td><a href='message_read?message_id="+ message_id +"'><b>"+ subject +"<br>"+ from +"</b></a></td><td><div class=\"Button Button--start\" ><button type='button' onclick=delete_message(\""+ message_id +"\")><span>Delete</span></button></div></td>"); 
                }
                else if(status.equals("deleted")){
                    // do nothing
                }
                else{
                    out.println("<td>unknown status: "+ status +"</td>");   
                }
                out.println("</tr>");
            }
        }
        catch(Exception e){
            System.out.println(e.toString());
        }
        
        out.println("</table>");
    }
    public void delete_message(String message_id){        
        String query = "UPDATE messages SET STATUS = 'deleted' WHERE messages.id = '"+ message_id +"'";
        try{
            Connection con = connect_to_db();
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);      
            con.close();
        }
        catch(Exception e){
            System.out.println(e.toString());
        }  
    }
    private Connection connect_to_db(){
        
        String url="jdbc:oracle:thin:ccpe/ccpe@localhost:1521:XE";
        
        try{
            Connection con = DriverManager.getConnection(url);
            return con;
        }
        catch(Exception e){
            System.out.println(e.toString());
            return null;
        }
    }
    private String get_person_full_name_from_id(String id){
        String full_name = "";
        String first_name = "";
        String last_name = "";
        
        String query = "SELECT people.first_name, people.last_name FROM people WHERE people.id='"+ id +"'";
        Connection con = connect_to_db();
        try{
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                first_name = rs.getString("first_name");
                last_name = rs.getString("last_name");
            }
        }
        catch(Exception e){
            System.out.println(e.toString());
        }
        full_name = first_name + " " +  last_name;
        return full_name;
    }
}
