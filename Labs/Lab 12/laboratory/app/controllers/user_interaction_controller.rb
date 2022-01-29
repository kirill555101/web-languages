# frozen_string_literal: true

class UserInteractionController < ApplicationController
  def login
    if @user = User.find_by_session_id(session[:session_id])
      redirect_to '/'
      return
    end

    @error = params[:error].nil? ? '' : params[:error]
  end

  def logout
    unless @user = User.find_by_session_id(session[:session_id])
      redirect_to '/'
      return
    end

    @user.session_id = '0'
    @user.save
    redirect_to '/'
    nil
  end

  def auth
    if @user = User.find_by_session_id(session[:session_id])
      redirect_to '/'
      return
    end

    name = params[:name]
    password = Digest::SHA1.hexdigest params[:password]

    error = ''
    if user = User.find_by_name(name)
      if user.password == password
        user.session_id = session[:session_id]
        user.save
      else
        error = 'Введен неверный пароль'
      end
    else
      error = 'Пользователь не найден'
    end

    if error == ''
      redirect_to '/'
      nil
    else
      redirect_to action: 'login', error: error
      nil
    end
  end

  def register
    if @user = User.find_by_session_id(session[:session_id])
      redirect_to '/'
      return
    end

    @error = params[:error].nil? ? '' : params[:error]
  end

  def create_new_user
    if @user = User.find_by_session_id(session[:session_id])
      redirect_to '/'
      return
    end

    name = params[:name]
    email = params[:email]
    password = params[:password]
    another_password = params[:another_password]

    if password != another_password
      redirect_to action: 'register', error: 'Введенные пароли не совпадают'
      return
    end

    error = ''
    if user = User.find_by_name(name)
      error = 'Пользователь с таким именем уже существует'
    end

    if user = User.find_by_email(email)
      error = 'Пользователь с такой почтой уже существует'
    end

    unless error == ''
      redirect_to action: 'register', error: error
      return
    end

    password = Digest::SHA1.hexdigest password
    @user = User.new(name: name, email: email, password: password, session_id: session[:session_id])
    unless @user.valid?
      redirect_to action: 'register', error: 'Проверьте правильность введенных данных'
      return
    end
    @user.save

    redirect_to '/'
  end

  def users_list
    unless @user = User.find_by_session_id(session[:session_id])
      redirect_to '/login'
      return
    end
    unless @user.name == 'admin'
      redirect_to '/'
      return
    end

    @users = User.all
  end

  def show_users_in_xml
    @users = User.all
    render xml: @users
  end
end
