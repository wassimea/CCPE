package project1;

import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class Messages {
    public Messages() {
        super();
    }
    public void generate_message(String message_id, PrintWriter out){
        // gather the neccessarry attributes first
        String from = "";
        String sender_id_fk = "";
        String subject = "";
        String message = "";
        
        // get message
        String query = "SELECT sender_id_fk, subject, message FROM messages WHERE messages.id='"+ message_id +"' ";
        Connection con = connect_to_db();
        try{
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                subject = rs.getString("subject");
                message = rs.getString("message");
                sender_id_fk = rs.getString("sender_id_fk");
            }
            con.close();
        }
        catch(Exception e){
            System.out.println(e.toString());
        }
        
        // get sender (from)
        query = "SELECT people.first_name, people.last_name FROM people WHERE people.id='"+ sender_id_fk +"' ";
        con = connect_to_db();
        try{
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                from = rs.getString("first_name") + " " +  rs.getString("last_name");
            }
            con.close();
        }
        catch(Exception e){
            System.out.println(e.toString());
        }
        
        // output
        out.println("<h3>From:</h3>");
        out.println("<p>"+ from +"</p>");
        out.println("<h3>Subject:</h3>");
        out.println("<p>"+ subject +"</p>");
        out.println("<h3>Message:</h3>");
        out.println("<p>"+ message +"</p>");
        out.println("</br><a href='mailbox'>< Back</a>");
        
        // update message status
        query = "UPDATE messages SET messages.status='read' WHERE messages.id='"+ message_id +"'";
        con = connect_to_db();
        try{
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);           
            con.close();
        }
        catch(Exception e){
            System.out.println(e.toString());
        }
        
    }
    public void send_message(String sender, String receivers, String message, String subject){
        // parse receivers into list
        String[] receivers_list;
        receivers_list = receivers.split(";");
        
        // send messages to receivers
        // sending a message is actually adding itin the messages table
        // with the proper mailbox foreign key and setting their status
        // as unread
        for(int i=0; i < receivers_list.length ; i++){
            String receiver = receivers_list[i];
            String receiver_id = get_person_id(receiver);
            String sender_id = get_person_id(sender);
            String receiver_mailbox_id = get_mailbox_id(receiver_id);
            String query = "INSERT INTO messages (subject, sender_id_fk, receiver_id_fk, message, status, mailbox_id_fk) VALUES ('"+ subject +"','"+ sender_id +"','"+ receiver_id +"', '"+ message +"', 'unread','"+ receiver_mailbox_id +"')";
            Connection con = connect_to_db();
            try{
                Statement stmt = con.createStatement();
                stmt.executeUpdate(query);
                con.close();
            }
            catch(Exception e){
                System.out.println(e.toString());
            }
        }
    }
    private String get_mailbox_id(String id){
        String mailbox_id = "";
        String query = "SELECT people.mailbox_id_fk FROM people WHERE people.id='"+ id +"' ";
        Connection con = connect_to_db();
        try{
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                mailbox_id = rs.getString("mailbox_id_fk");
            }
            con.close();
        }
        catch(Exception e){
            System.out.println(e.toString());
        }        
        return mailbox_id;   
    }
    private String get_person_id(String person){
        String person_id = "";
        String column_to_check = "";
        // receiver could be username or email
        // #never_forget
        if(person.contains("@")){
            // if email
            column_to_check = "email";
        }
        else{
            // if username
            column_to_check = "username";
        }
        
        String query = "SELECT people.id FROM people WHERE people."+ column_to_check +"='"+ person +"' ";
        Connection con = connect_to_db();
        try{
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                person_id = rs.getString("id");
            }
            con.close();
        }
        catch(Exception e){
            System.out.println(e.toString());
        }
        
        
        return person_id;   
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
}
