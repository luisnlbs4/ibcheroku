class RehabilitationsController < ApplicationController

  def index
  	user_auth
  	@rehabilitations = Rehabilitation.where("blind_id=?",params[:id])
  end

  def create
  	recived = params[:rehabilitation][:received?]
  	@rehabilitation = Rehabilitation.new(rehabilitation_params)

	if @rehabilitation.save
		redirect_to "/blinds/"+@rehabilitation.blind.id.to_s, notice: "Rehabilitation creado exitosamente"
	else
		redirect_to "/blinds/"+@rehabilitation.blind.id.to_s, notice: "Error al crear rehabilitation"
	end
  end



  def rehabilitation_params
	params.require(:rehabilitation).permit(:received?,:place,:first_date,:last_date,:type_rehab,:training_skils,:blind_id)
  end

end
