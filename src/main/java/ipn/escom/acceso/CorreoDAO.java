package ipn.escom.acceso;

import ipn.escom.manejo.CorreoDTO;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class CorreoDAO {
    
    public void enviarCorreo(CorreoDTO dto) throws Exception{
        System.out.println("Sending1...");
        //static final String remitente = dto.getEntidad().getRemitente();
        String receptor = dto.getEntidad().getReceptor();
        //String receptor = "lightyagami201";
        //String contra = dto.getEntidad().getContra();
        String remitente = "zenitsu.demons.aga@gmail.com";
        String contra = "hvhjeoc0901";
        String SUBJECT = "Te han invitado a un intercambio";
        String BODY = String.join(
                System.getProperty("line.separator"),
                "<h1>Invitacion a un intercambio</h1>",
                "<p>Para poder entrar al intercambio debe entrar al siguiente enlace ",
                "<a href='http://tradescom.herokuapp.com/register.html'>Registrarse</a>"
        );
        System.out.println("Sending2!...");
        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
        props.put("mail.smtp.user", remitente);
        props.put("mail.smtp.clave", "hvhjeoc0901");    //La clave de la cuenta
        props.put("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
        props.put("mail.smtp.starttls.enable", "true"); //Para conectar de manera segura al servidor SMTP
        props.put("mail.smtp.port", "587"); //El puerto SMTP seguro de Google
        System.out.println("Sending3...");
        try {
            Session session = Session.getDefaultInstance(props, null);
            System.out.println("AAAAAAAA1");
            MimeMessage message = new MimeMessage(session);
            System.out.println("AAAAAAAA2");
            message.setFrom(new InternetAddress(remitente));
            System.out.println("AAAAAAAA3");
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(receptor));
            System.out.println("AAAAAAAA4");
            message.setSubject(SUBJECT);
            System.out.println("AAAAAAAA5");
            message.setContent(BODY, "text/html");
            System.out.println("Sending4...");
            Transport t = session.getTransport("smtp");
            System.out.println("Sending5...");

            System.out.println("Sending...");
            t.connect("smtp.gmail.com", remitente, contra);
            t.sendMessage(message, message.getAllRecipients());
            t.close();
        } catch (Exception ex) {
            System.out.println("The email was not sent.");
            System.out.println("Error message: " + ex.getMessage());
        }
    }
}
