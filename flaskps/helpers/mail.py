from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
 

def enviar(sujeto="Sistema",contenido="Si ves esto es que hubo en error en el contenido del mail.",mailTo="redcomedoreslp@gmail.com"):
    # create message object instance
    msg = MIMEMultipart()
    
    message = contenido
    
    # setup the parameters of the message
    password = "Huellaverde19"
    msg['From'] = "redcomedoreslp@gmail.com"
    msg['To'] = mailTo
    msg['Subject'] = sujeto
    
    # add in the message body
    msg.attach(MIMEText(message, 'plain'))
    
    #create server
    server = smtplib.SMTP('smtp.gmail.com: 587')
    
    server.starttls()
    
    # Login Credentials for sending the mail
    server.login(msg['From'], password)
    
    # send the message via the server.
    server.sendmail(msg['From'], msg['To'], msg.as_string())
    
    server.quit()
    return True


            