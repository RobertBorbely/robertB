class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
        flash.now[:error] = nil
    else
        flash.now[:error] = 'Nem tudtam elküldeni az üzenetet!'
        render :new
    end
  end
end
