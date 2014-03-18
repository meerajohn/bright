module NavigationHelper
  def is_active?(controllers, actions = nil)
    "active" if controllers.include?(params[:controller].to_sym) &&
                (!actions || actions.include?(params[:action].to_sym))
  end
end
