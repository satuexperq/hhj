module ApplicationHelper

  def nav_link
    render :partial => "shared/navi_link", :locals => {}
  end

  def languages
    I18n.fallbacks.keys.concat(I18n.available_locales).uniq
  end

  def modal_dialog
    case params[:modal]
    when 'new-organ'
      render "modals/create-new-organ", formats: [:html]
    when 'cfa'
      render "modals/call-for-application", formats: [:html]
    when 'application'
      render "modals/received-application", formats: [:html]
    when 'message'
      render "modals/send-group-message", formats: [:html]
    when 'send-application'
      render "modals/send-application", formats: [:html]
    else
      ;
    end
  end

  def new_organ_modal_path
    "?modal=new-organ"
  end

  def close_modal_path
    "?"
  end

  def modal_wrap_style
    if params[:modal]
      ""
    else
      "display: none"
    end
  end

end
