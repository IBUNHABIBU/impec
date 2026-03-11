module NavigationHelper
  def nav_link_to(name, path, options = {})
    options[:class] ||= ""
    options[:class] += " inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium"
    
    if current_page?(path)
      options[:class] += " border-amber-300 text-gray-100"
    else
      options[:class] += " border-transparent text-gray-100 hover:border-amber-200 hover:text-amber-200"
    end
    
    link_to name, path, options
  end
  
  def mobile_nav_link_to(name, path, options = {})
    options[:class] ||= ""
    options[:class] += " block pl-3 pr-4 py-2 border-l-4 text-base font-medium"
    
    if current_page?(path)
      options[:class] += " bg-green-700 border-amber-300 text-amber-300"
    else
      options[:class] += " border-transparent text-gray-100 hover:bg-green-600 hover:border-amber-200 hover:text-amber-200"
    end
    
    link_to name, path, options
  end
end