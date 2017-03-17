class ConversationsController < ApplicationController
	before_filter :authenticate_contact!
  helper_method :mailbox, :conversation

  def index
  	
  end

  def new
    @email = params[:email]
  end

  def create
    recipient_emails = conversation_params(:recipients).split(',')
    recipients = Contact.where(work_email: recipient_emails).all
    
    conversation = current_contact.send_message(recipients, *conversation_params(:body, :subject)).conversation
    if conversation.present?
      redirect_to conversation_path(conversation)
    else
      redirect_to request.referer, notice: "Enter value first"
    end
  end

  def reply
    current_contact.reply_to_conversation(conversation, *message_params(:body, :subject))
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_contact)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_contact)
    redirect_to :conversations
  end

  private

  def mailbox
    @mailbox ||= current_contact.mailbox
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
