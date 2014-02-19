class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render :json => @contact
    else
      render :json => @contact.errors.full_messages
    end
  end

  def destroy
    get_contact
    @contact.destroy
    render :json => @contact
  end

  def index
    render :json => Contact.contacts_for_user_id(params[:user_id])
  end

  def favorites
    render :json => Contact.contacts_for_user_id(params[:user_id])
    .where(favorite: true)
  end

  def show
    get_contact
    render :json => @contact
  end

  def update
    get_contact
    if @contact.update_attributes(contact_params)
      render :json => @contact
    else
      render :json => @contact.errors.full_messages
    end
  end

  private
  def get_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id, :favorite)
  end
end
