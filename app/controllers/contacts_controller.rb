class ContactsController < ApplicationController
  before_action :find_contact, only: [:show, :destroy, :edit, :update]

  def show

  end

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.number = Phony.normalize(@contact.number)
    if @contact.save
      flash[:notice] = "#{@contact.name} has been added to your contacts!"
      redirect_to contacts_path
    else
      flash[:alert] = @contact.errors.full_messages.first
      render :new
    end
  end

  def edit

  end

  def update
    @contact.update(contact_params)
  end

  def destroy

  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :number)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end

end
