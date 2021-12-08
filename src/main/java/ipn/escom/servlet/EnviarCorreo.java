/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ipn.escom.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;

/**
 *
 * @author jemil
 */
public class EnviarCorreo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        String correo, pass;
        correo = request.getParameter("email");
        pass = request.getParameter("password");
        System.out.println("--------En el Servlet: ");
        System.out.println(request.getParameter("emailAmigo"));
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset='utf-8'>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0, shrink-to-fit=no'>");
            out.println("<title>tradESCOM</title>");
            out.println("<link rel='stylesheet' href='assets/bootstrap/css/bootstrap.min.css'>");
            out.println("<link rel='stylesheet' href='assets/fonts/fontawesome-all.min.css'>");
            out.println("<link rel='stylesheet' href='assets/fonts/font-awesome.min.css'>");
            out.println("<link rel='stylesheet' href='assets/fonts/fontawesome5-overrides.min.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Animated-Pretty-Product-List-v12.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Color-Contact-List.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Highlight-Phone.css'>");
            out.println("<link rel='stylesheet' href='assets/css/HTML-layout-with-an-unordered-list.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Light-Contact-List.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Login-Form-Clean-1.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Login-Form-Clean.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Navigation-with-Search.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Notes-Dashboard.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Pretty-Registration-Form.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Pretty-User-List.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Projects-Horizontal.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Registration-Form-with-Photo.css'>");
            out.println("<link rel='stylesheet' href='assets/css/styles.css'>");
            out.println("<link rel='stylesheet' href='assets/css/Team-Boxed.css'>");
            out.println("<title>Servlet EnviarCorreo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<nav class='navbar navbar-light navbar-expand-md navigation-clean-search'>");
            out.println("<div class='container'><a class='navbar-brand' href='index.html'>TradESCOM</a><button data-bs-toggle='collapse' class='navbar-toggler' data-bs-target='#navcol-1'><span class='visually-hidden'>Toggle navigation</span><span class='navbar-toggler-icon'></span></button>");
            out.println("<div class='collapse navbar-collapse text-center' id='navcol-1'>");
            out.println("<ul class='navbar-nav me-auto'>");
            out.println("<li class='nav-item'><a class='nav-link' href='dashboard.jsp?email="+correo+"&password="+pass+"'>Dashboard</a></li>");
            out.println("<li class='nav-item'><a class='nav-link' href='friends.jsp?email="+correo+"&password="+pass+"'>Mis amigos</a></li>");
            out.println("<li class='nav-item'><a class='nav-link active' href='items.jsp?email="+correo+"&password="+pass+"'>Nuevo Amigo</a></li>");
            out.println("</ul><a class='btn btn-light action-button' role='button' href='Especificaciones.jsp?email="+correo+"&password="+pass+"'>Crea un intercambio!</a>");
            out.println("</div>");
            out.println("</div>");
            out.println("</nav>");
            //-------------------------------------------------SECCION DE LOS CORREOS---------------------------------------------------------------------------------------------------------------------------
            String receptor = request.getParameter("emailAmigo");
            final String remitente = "zenitsu.demons.aga@gmail.com";
            final String contras = "hvhjeoc0901";
            String SUBJECT = "Te han invitado a un intercambio";
            String BODY = String.join(
                System.getProperty("line.separator"),
                "<h1>Invitacion a un intercambio</h1>",
                "<p>Para poder entrar al intercambio debe entrar al siguiente enlace ",
                "<a href='http://tradescom.herokuapp.com/register.html'>Registrarse</a>"
            );
            System.out.println("Sending2!...");
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
            props.put("mail.smtp.port", "587"); //El puerto SMTP seguro de Google
            //props.put("mail.smtp.clave", contras);    //La clave de la cuenta
            props.put("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
            props.put("mail.smtp.starttls.enable", "true"); //Para conectar de manera segura al servidor SMTP
            System.out.println("Sending3...");
            props.put("mail.smtp.user", remitente);
            System.out.println("Sending10...");
            /*try {
                Session vars;
                System.out.println("Sending11...");
                vars = Session.getInstance(props);
                //System.out.println(vars);
                System.out.println("AAAAAAAA1");
                Message msg = new MimeMessage(vars);
                System.out.println("AAAAAAAA2");
                msg.setFrom(new InternetAddress(remitente));
                
                System.out.println("AAAAAAAA3");
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receptor));
                System.out.println("AAAAAAAA4");
                msg.setSubject(SUBJECT);
                System.out.println("AAAAAAAA5");
                msg.setContent(BODY, "text/html");
                System.out.println("Sending4...");
        
                Transport t = vars.getTransport("smtp");
                System.out.println("Sending5...");
                
                System.out.println("Sending...");
                t.connect(remitente, contras);
                t.sendMessage(msg, msg.getAllRecipients());
                t.close();
            } catch (MessagingException ex) {
                System.out.println("The email was not sent.");
                System.out.println("Error message: " + ex.getMessage());
            }catch (Exception e){
                System.out.println("The email was not sent.");
                System.out.println("Error message: " + e.getMessage());
            }*/
            for(int i=0; i<400000; i++){
                System.out.println("Esperando...."+i);
            }
//------------------------------------------------------------------------------------------Final de los correos-----------------------------------------------------------------------------------
            out.println("<div class='alert alert-success alert-dismissible fade show' role='alert' align='center'>");
            out.println("<strong>El correo se ha enviado</strong>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
