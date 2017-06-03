class WelcomeController < ApplicationController
  def index
        @publications = Publication.all.order('updated_at DESC')
  end
  def message
    @name = params[:name]
    @email = params[:correo]
    @asunto = params[:asunto]
    @mensaje = params[:mensaje]
    MessageMailer.new_message(@name,@asunto,@email,@mensaje).deliver
    redirect_to "/", notice: "Guardado con Exito"

  end
end
