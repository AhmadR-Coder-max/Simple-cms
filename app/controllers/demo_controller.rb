class DemoController < ApplicationController
  layout 'application'

  before_action :confirm_logged_in

  def index
    # render(:template => 'demo/hello')
    # render('demo/hello')
    # render('hello')
  end

  def hello
    # render('index')
    @array = [1, 2, 3, 4, 5]
    @id = params['id'].to_i
    @page = params[:page].to_i
  end

  def other_hello
    redirect_to(:controller => "demo" ,:action => 'index')
  end

  def lyanda
    redirect_to('http://www.lyanda.com')
  end

  def text_helpers
  end

  def escape_output
  end

end
