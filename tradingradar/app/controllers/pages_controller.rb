class PagesController < ApplicationController
  def contacts
    #@message = Message.new

    if params[:authenticity_token]
      puts "**POST"
      @message = Message.new(message_params)

      if @message.valid?
        #MessageMailer.new_message(@message).deliver_now
        GenericMailer.contact(@message.name, @message.email, @message.message).deliver_now
        redirect_to contacts_path, notice: t("contacts.messageSent")
      else
        flash[:alert] = t("contacts.messageError")
      end
    else
      puts "**GET"
      @message = Message.new
    end
  end

  def about
  end

  def privacy_policy
  end

  private

  def message_params
    params.permit(:name, :email, :message)
  end
end
