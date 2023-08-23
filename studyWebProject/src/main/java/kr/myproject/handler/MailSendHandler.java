package kr.myproject.handler;

import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

//메일 인증 처리 담당 handler(공통 기능)
@Component
public class MailSendHandler {
	
	@Autowired
	private JavaMailSender mailSender;

	public String sendEmailCode(String email) {
	String confirmCode = UUID.randomUUID().toString().substring(0,4);
			
			System.out.println("핸들러에서 만들어진 인증 코드 : " + confirmCode);
			
			MimeMessage mail = mailSender.createMimeMessage();
			System.out.println(mail);
			
			String contents = "<h3>HappyStudy에서 발송한 인증 메일입니다.</h3><br>"
					+ "<span>발송된 인증 코드를 확인하시고 홈페이지에서 인증을 완료하세요!</span>"
					+ "<h3>"+confirmCode+"</h3>";
			
			try {
				mail.setSubject("HappyStudy 이메일 인증", "utf-8");
				mail.setText(contents, "utf-8", "html");
				mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
				mailSender.send(mail);
				
				return confirmCode;
				
			} catch (MessagingException e) {
			}
			
			return "fail";

		}
	
}
