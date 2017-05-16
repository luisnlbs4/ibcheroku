class BlindsController < ApplicationController

	def index
		user_auth
		@blinds = Blind.where(original: false)
	end

	def new
		user_auth
		@blind = Blind.new
	end

	def show
		user_auth
		@blind = Blind.find(params[:id])
	end


	def edit
		user_auth
		@blind = Blind.find(params[:id])
	end

	def create

		@blind = Blind.new(blind_params)
		if @blind.save
			@medical = Medical.new(medical_params)
			@medical.blind_id = @blind.id
			if @medical.save
				@home = Home.new(home_params)
				@home.blind_id = @blind.id
				if @home.save
					@rehab = Rehabilitation.new(rehabilitation_params)
					@rehab.blind_id = @blind.id
					if @rehab.save
						create_original(blind_params,medical_params,home_params,rehabilitation_params)
						redirect_to "/blinds", notice: "Guardado con Exito"
					else
						@blind.destroy
						@medical.destroy
						@home.destroy
						render "new", notice: "No se pudo guardar"
					end
				else
					@blind.destroy
					@medical.destroy
					render "new", notice: "No se pudo guardar"
				end
			else
				@blind.destroy
				render "new", notice: "No se pudo guardar"
			end

		else
			render "new", notice: "No se pudo guardar"
		end
	end

	def reports

     user_auth
     @blinds = Blind.where(original: false)
		 @blinds = @blinds.joins(:medical)
		 @grado= params[:grado]
		 @caja= params[:caja]
		 @discapacidad= params[:Discapacidad]
		 @edad= params[:Edad]
		 @sexo= params[:sexo]
		 @vacio = ""

     if @sexo != "ambos" && @sexo != ""
			 @blinds = @blinds.where("sex=?",@sexo)
     end
		 if @grado != "todos" && @grado != ""
       @blinds = @blinds.where("degree_instruction=?",@grado)
		 end

		 @Fecha=(Date.current)-(18.year)
		 if @edad != "ambos"
			 if @edad == "mayor18"
			 	   @blinds = @blinds.where("birthday<=?",@Fecha)
			 end
			 if @edad == "menor18"
					@blinds = @blinds.where("birthday >?",@Fecha)
			end
		end
		if @discapacidad != "ambos"
			if @discapacidad == "multiple"
				@blinds = @blinds.where("additional_disability != ?", @vacio)
			end
			if @discapacidad == "solo Ceguera"
				@blinds = @blinds.where("additional_disability == ?", @vacio)
	   	end
		end
		if @caja != "ambos"
			if @caja == "si"
				@blinds = @blinds.where("name_health_insurance != ? ",@vacio)
			end
			if @caja == "no"
				@blinds = @blinds.where("name_health_insurance == ?",@vacio)
			end
		end

	end

	def update

		@blind = Blind.find(params[:id])
		if @blind.update_attributes(blind_params)
			@medical = @blind.medical
			if @medical.update_attributes(medical_params)
				@home = @blind.home
				if @home.update_attributes(home_params)
					@rehab = @blind.rehabilitation
					if @rehab.update_attributes(rehabilitation_params)
						redirect_to "/blinds/"+@blind.id.to_s, notice: "Editado con Exito"
					else
						@blind.destroy
						@medical.destroy
						@home.destroy
						render "edit", notice: "No se pudo editar"
					end
				else
					@blind.destroy
					@medical.destroy
					render "edit", notice: "No se pudo editar"
				end
			else
				@blind.destroy
				render "edit", notice: "No se pudo editar"
			end

		else
			render "edit", notice: "No se pudo editar"
		end
	end


	def create_original(blind_params,medical_params,home_params,rehabilitation_params)
		@blind = Blind.new(blind_params)
		@blind.original = true
		@blind.save
		@medical = Medical.new(medical_params)
		@medical.blind_id = @blind.id
		@medical.save
		@home = Home.new(home_params)
		@home.blind_id = @blind.id
		@home.save
		@rehab = Rehabilitation.new(rehabilitation_params)
		@rehab.blind_id = @blind.id
		@rehab.save
	end

	def blind_params
		params.require(:blind).permit(:first_name,:second_name,:first_lastname,:second_lastname,:lastname_married,:civil_status,:address,:zone,:province,:department,:nationality,:language,:sex,:registration_date,:birthday,:country_birth,:city_birth,:province_birth,:ci,:cellphone,:beneficiary_income,:current_occupation,:previous_occupation,:degree_instruction,:other_studies)
	end

	def medical_params
		params.require(:blind).permit(:type_blindness,:causes_blindness,:time_blindness,:general_diagnosis,:medical_attention_place,:additional_disability,:health_insurance?,:name_health_insurance)
	end

	def home_params
		params.require(:blind).permit(:zone,:home_type,:services,:tenecia,:accessibility,:rooms,:bathroom?,:kitchen?,:wall_type,:roof_type,:floor_type)
	end

	def rehabilitation_params
		params.require(:blind).permit(:received?,:place,:first_date,:last_date,:type_rehab,:training_skils)
	end

end
