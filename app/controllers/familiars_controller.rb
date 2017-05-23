class FamiliarsController < ApplicationController
  def create
  	@familiar = Familiar.new(familiar_params)
		if @familiar.save
			redirect_to "/blinds/"+@familiar.blind.id.to_s, notice: "Familiar creado exitosamente"
		else
			redirect_to "/blinds/"+@familiar.blind.id.to_s, notice: "Error al crear familiar"
		end
  end

  def edit
    user_auth
    @familiar = Familiar.find(params[:id])
  end

  def update
    
    @familiar = Familiar.find(params[:id])
    if @familiar.update_attributes(familiar_params)
      redirect_to "/blinds/"+@familiar.blind.id.to_s, notice: "Familiar modificado exitosamente"
    else
      redirect_to "/blinds/"+@familiar.blind.id.to_s, notice: "Error al modificado familiar"
    end
  end

  def delete
    user_auth
  	@familiar = Familiar.find(params[:id])
  	blind_id = @familiar.blind_id
  	if @familiar.destroy
  		redirect_to "/blinds/"+blind_id.to_s, notice: "Familiar borrado"
  	else
  		redirect_to "/blinds/"+blind_id.to_s, notice: "Error al borrar"
  	end
  end

  def familiar_params
	params.require(:familiar).permit(:relationship,:names,:first_lastname,:second_lastname,:degree_instruction,:occupation,:disability,:birthday,:observation,:cellphone ,:blind_id)
  end

end
