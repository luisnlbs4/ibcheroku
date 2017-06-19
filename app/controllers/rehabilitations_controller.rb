class RehabilitationsController < ApplicationController


  def index
  	user_auth
  	@rehabilitations = Rehabilitation.where("blind_id=?",params[:id])
  end

  def delete
      user_auth
      @rehabilitation = Rehabilitation.find(params[:id])
      id = @rehabilitation.blind_id.to_s
      if @rehabilitation.destroy
        redirect_to "/blinds/"+id+"/rehabilitations/", notice: "Afiliado borrado"
      else
        redirect_to "/blinds/"+id+"/rehabilitations/", notice: "Error al borrar"
      end
  end

  def create
  	recived = params[:rehabilitation][:received?]

  	@rehabilitation = Rehabilitation.new(rehabilitation_params)

	if @rehabilitation.save
		redirect_to "/blinds/"+@rehabilitation.blind.id.to_s, notice: "Rehabilitation creado exitosamente"
	else
		redirect_to "/blinds/"+@rehabilitation.blind.id.to_s+"/rehabilitations", notice: "Error al crear rehabilitation"
	end
  end



  def rehabilitation_params
	params.require(:rehabilitation).permit(:recived,:place,:first_date,:last_date,:type_rehab,:training_skils,:blind_id,:type_rehab_others)
  end

end
