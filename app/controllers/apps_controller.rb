class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]


  def index
    @apps = App.all.reverse
  end


  def show
  end


  def new
    @app = current_user.apps.build
  end


  def edit
  end


  def create
    @app = current_user.apps.build(app_params)
    charge_error = nil

    if @app.valid?
      begin
        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :card  => params[:stripeToken]
        )

        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => params[:amount],
          :description => 'App Nomination',
          :currency    => 'usd'
        )

        nomination = Nomination.create(
          name: params[:appName],
          store: params[:appStore],
          url: params[:appUrl],
          description: params[:appDescription],
          stripe_description: charge.description,
          email: params[:stripeEmail],
          amount: params[:amount],
          currency: charge.currency,
          customer_id: customer.id,
          card: params[:stripeToken],
          product_id: 1,
          uuid: SecureRandom.uuid,
          user_id: current_user.id
        )
      rescue Stripe::CardError => e
        charge_error = e.message
        redirect_to charges_path
      end
      if charge_error
        flash[:error] = charge_error
        render :new
      else
        @app.save
        redirect_to nomination, notice: 'App was successfully created.'
      end
    else
      flash[:error] = 'one or more error is your order'
      render :new
    end
  end

  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_app
      @app = App.find(params[:id])
    end

    def correct_user
      @app = current_user.apps.find_by(id: params[:id])
      redirect_to apps_path, notice: "not autorized to edit this app" if @app.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :store, :url, :description, :image)
    end
end
