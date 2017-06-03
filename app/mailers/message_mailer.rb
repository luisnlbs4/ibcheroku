class MessageMailer < ApplicationMailer

  default from: 'hechoenbolivia73@gmail.com'
  def new_message(usuario,asunto,email,mensaje)
    @usuario=usuario
    @asunto=asunto
    @email=email
    @mensaje=mensaje
    mail(to: "luisnlbs4@gmail.com" , subject: "Mensaje de La pagina IBC")
  end
end
