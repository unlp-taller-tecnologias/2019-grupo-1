from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
 

def enviar(sujeto="Sistema",contenido="Si ves esto es que hubo en error en el contenido del mail.",mailTo="envios@xn--foroporlaniez-skb.org.ar"):
    # create message object instance
    msg = MIMEMultipart()
    
    message = contenido
    
    # setup the parameters of the message
    password = "sistema2020"
    msg['From'] = "envios@xn--foroporlaniez-skb.org.ar"
    msg['To'] = mailTo
    msg['Subject'] = sujeto
    
    # add in the message body
    msg.attach(MIMEText(message, 'plain'))
    
    #create server
    server = smtplib.SMTP('mail.xn--foroporlaniez-skb.org.ar:587')
    
    server.starttls()
    
    # Login Credentials for sending the mail
    server.login(msg['From'], password)
    
    # send the message via the server.
    server.sendmail(msg['From'], msg['To'], msg.as_string())
    
    server.quit()
    return True


            