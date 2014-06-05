class ConversationsController < ApplicationController

	before_filter :signed_in_user 
	before_filter :correct_user,   only: [:edit, :update]
	#before_filter :admin_user,     only: [:edit, :update]
	respond_to :json, :html, :xml, :js

	helper_method :mailbox, :conversation

  def create
	#@beer = @profile.beer.build(params[:beer])
    recipient_emails = conversation_params(:recipients).split(',')
    recipients = Profile.where(id: recipient_emails).all

    conversation = current_profile.
      send_message(recipients, *conversation_params(:body, :subject)).conversation

    redirect_to conversation
  end

  def reply
    current_profile.reply_to_conversation(conversation, *message_params(:body, :subject))
    redirect_to conversation
  end

  def trash
    conversation.move_to_trash(current_profile)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_profile)
    redirect_to :conversations
  end

  private

  def mailbox
    @mailbox ||= current_profile.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end

end
