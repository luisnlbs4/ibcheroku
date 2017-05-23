class UserController < ApplicationController

  def index
  	user_auth
  	@users = User.all
  end

  def new
  	user_auth
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
		if @user.save
      role = params[:user][:role]
      addRoleToUser(@user,role)
			redirect_to "/user", notice: "usuario creado exitosamente"
		else
			redirect_to "/user/new", notice: "Error al crear usuario"
		end
  end

  def lock_unlock
    #This locks and unlocks users
    @user=User.find(params[:id])
    if params[:status]=='true'
      @user.lock_access!
      @user.save
      redirect_to '/user'
    else
      @user.unlock_access!
      @user.save
      redirect_to '/user'
    end
  end

  def permitted_params
    #These are permitted parameters
        params.permit(:user => [:id, :status])
  end


  def user_params
	params.require(:user).permit(:name,:lastname,:email,:password,:password_confirmation)
  end

  def addRoleToUser(user,role)
    if(role =="administrador" )
      user.add_role :Administrador
      elsif (role =="modificador" )
        user.add_role :Modificador
      else
        user.add_role :Visitante
    end
  end

end
