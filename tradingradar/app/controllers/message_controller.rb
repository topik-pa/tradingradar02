class MessageController < ApplicationController
  def emailreset
    $message = ""
    resetEmailCode = params[:resetEmailCode] ? params[:resetEmailCode] : nil
    if resetEmailCode
      $message = I18n.t("layouts.messagePage.somethingWrong")
      resetEmailType = params[:resetEmailType] ? params[:resetEmailType] : nil
      begin
        case resetEmailType
        when "stock"
          target = FollowStockNewsletter.find_by code: resetEmailCode
        when "market"
          target = MarketSuggestionsNewsletter.find_by code: resetEmailCode
        else
          #nothing
        end
        target.sended = 0
        target.save!
        $message = I18n.t("layouts.messagePage.emailResetOK")
      rescue StandardError => e
        error = "Resetting email " + resetEmailCode.to_s + " for type " + resetEmailType.to_s + ". Email type not found"
        ServerErrorOccurredMailer.generic(error).deliver_now
      end
    end
  end
end
