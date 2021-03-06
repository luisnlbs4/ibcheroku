class BlindsController < ApplicationController

	def index
		user_auth
		@blinds = Blind.all.order("first_lastname ASC")

		@tipoBusqueda = params[:busqueda]
		@texto = params[:texto]
		if @tipoBusqueda == "apellido paterno"
			@blinds = @blinds.where("first_lastname LIKE ?", "%#{@texto}%")
			@blinds = @blinds.order("first_lastname ASC")
		end
		if @tipoBusqueda == "apellido materno"
			@blinds = @blinds.where("second_lastname LIKE ?","%#{@texto}%")
			@blinds = @blinds.order("second_lastname ASC")
		end
		@blinds = @blinds.paginate(page: params[:page],per_page:15).where(original: false)
	end

	def new
		user_auth
		@blind = Blind.new
	end

	def show
		user_auth
		@blind = Blind.find(params[:id])
	end

	def delete
	    user_auth
	  	@blind = Blind.find(params[:id])
	  	if @blind.destroy
	  		redirect_to "/blinds/", notice: "Afiliado borrado"
	  	else
	  		redirect_to "/blinds/", notice: "Error al borrar"
	  	end
	end

	def edit
		user_auth
		@blind = Blind.find(params[:id])
	end

	def create

		params[:blind][:health_insurance] = convert_si_to_true(params[:blind][:health_insurance])
		params[:blind][:kitchen] = convert_si_to_true(params[:blind][:kitchen])
		params[:blind][:bathroom] = convert_si_to_true(params[:blind][:bathroom])

		@blind = Blind.new(blind_params)
		if @blind.save
			@medical = Medical.new(medical_params)
			@medical.blind_id = @blind.id
			if @medical.save
				@home = Home.new(home_params)
				@home.blind_id = @blind.id
				if @home.save
						create_original(blind_params,medical_params,home_params)
						redirect_to "/blinds", notice: "Guardado con Exito"
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

	def convert_si_to_true(param)
		return param == "si"
	end

	def update
		@blind = Blind.find(params[:id])

		params[:blind][:health_insurance] = convert_si_to_true(params[:blind][:health_insurance])
		params[:blind][:kitchen] = convert_si_to_true(params[:blind][:kitchen])
		params[:blind][:bathroom] = convert_si_to_true(params[:blind][:bathroom])
		
		if @blind.update_attributes(blind_params)
			@medical = @blind.medical
			if @medical.update_attributes(medical_params)
				@home = @blind.home
				if @home.update_attributes(home_params)
						redirect_to "/blinds/"+@blind.id.to_s, notice: "Editado con Exito"					
				else
					render "edit", notice: "No se pudo editar"
				end
			else
				render "edit", notice: "No se pudo editar"
			end
		else
			render "edit", notice: "No se pudo editar"
		end
	end


	def create_original(blind_params,medical_params,home_params)
		@blind = Blind.new(blind_params)
		@blind.original = true
		@blind.save
		@medical = Medical.new(medical_params)
		@medical.blind_id = @blind.id
		@medical.save
		@home = Home.new(home_params)
		@home.blind_id = @blind.id
		@home.save
	end

	def reports
     user_auth
	 @blinds = Blind.all
     @blinds = @blinds.where(original: false)
	 @blinds = @blinds.joins(:medical)
	 @grado= params[:grado]
	 @caja= params[:caja]
	 @discapacidad= params[:Discapacidad]
	 @edad= params[:Edad]
	 @sexo= params[:sexo]

     if @sexo != "ambos"
			 @blinds = @blinds.where("sex=?",@sexo)
     end
		 if @grado != "todos"
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
		@vacio = ""
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
				respond_to do |format|
				format.html
				format.csv { send_data @blinds.to_csv }
				format.xls # { send_data @blinds.to_csv(col_sep: "\t") }
		   end

	end

	def blind_params
		params.require(:blind).permit(:first_name,:second_name,:first_lastname,:second_lastname,:lastname_married,:civil_status,:address,:zone,:province,:department,:nationality,:language,:sex,:registration_date,:birthday,:country_birth,:city_birth,:province_birth,:ci,:cellphone,:beneficiary_income,:current_occupation,:previous_occupation,:degree_instruction,:other_studies,:beneficiary_income_others,:social_diagnosis)
	end

	def medical_params
		params.require(:blind).permit(:type_blindness,:causes_blindness,:time_blindness,:general_diagnosis,:medical_attention_place,:additional_disability,:health_insurance,:name_health_insurance)
	end

	def home_params
		params.require(:blind).permit(:zone,:home_type,:services,:tenecia,:accessibility,:rooms,:bathroom,:kitchen,:wall_type,:roof_type,:floor_type,:tenecia_others,:wall_type_others,:roof_type_others,:floor_type_others,:services_others,:accessibility_others)
	end

	def rehabilitation_params
		params.require(:blind).permit(:recived,:place,:first_date,:last_date,:type_rehab,:training_skils)


	end

end
