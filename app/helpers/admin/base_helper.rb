module Admin::BaseHelper
  def body_class
    "controller_#{params[:controller].gsub('/', '_')} action_#{params[:action]}"
  end

  def alert_level(level)
    case level
    when 'notice' then 'info'
    when 'alert'  then 'warning'
    when 'error'  then 'danger'
    else level
    end
  end
end
