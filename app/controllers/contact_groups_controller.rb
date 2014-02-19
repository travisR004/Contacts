class ContactGroupsController < ApplicationController
  def create
   @contact_group = ContactGroup.new(contact_group_params)
   if @contact_group.save
     render :json => @contact_group
   else
     render :json => @contact_group.errors.full_messages,
     :status => :unprecessable_entity
   end
  end

  def destroy
    get_contact_group
    @contact_group.destroy
    render :json => @contact_group
  end

  def index
    user_groups = ContactGroup.contact_groups_for_user_id(params[:user_id])
    user_groups = user_groups.includes(:contacts)
    render :json => user_groups.to_json(:include => :contacts)
  end

  def show
    get_contact_group
    render :json => @contact_group
  end

  def update
    get_contact_group
    if @contact_group.update_attributes(contact_group_params)
      render :json => @contact_group
    else
      render :json => @contact_group.errors.full_messages,
      :status => :unprecessable_entity
    end

  end

  private
  def get_contact_group
    @contact_group = ContactGroup.find(params[:id])
  end

  def contact_group_params
    params.require(:contact_group).permit(:user_id)
  end
end
