module ApplicationHelper
  def flash_class(type)
    case type.to_sym
    when :notice then "bg-green-800 border border-green-700 text-gray-100" # Deep green
    when :alert, :error then "bg-amber-800 border border-amber-700 text-gray-100" # Earthy brown alternative
    else "bg-amber-300 border border-amber-400 text-gray-900" # Golden yellow
    end
  end

  def flash_icon(type)
    case type.to_sym
    when :notice
      '<svg class="h-5 w-5 text-gray-100" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
      </svg>'.html_safe
    when :alert, :error
      '<svg class="h-5 w-5 text-gray-100" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
      </svg>'.html_safe
    else
      '<svg class="h-5 w-5 text-gray-900" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2h-1V9z" clip-rule="evenodd" />
      </svg>'.html_safe
    end
  end

  def inline_svg_tag(filename, options = {})
  file_path = Rails.root.join('app', 'assets', 'images', "#{filename}.svg")
    if File.exist?(file_path)
      file_content = File.read(file_path)
      css_class = options[:class] || ''
      file_content.gsub('<svg', "<svg class='#{css_class}'").html_safe
    else
      content_tag(:span, "Icon not found: #{filename}", class: options[:class])
    end
  end

  def nav_link_to(text, path, options = {})
    options[:class] ||= ""
    options[:class] += " inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium"
    
    current_path = request.path
    is_current = current_path == path || (path != root_path && current_path.start_with?(path))
    
    if is_current
      options[:class] += " border-amber-300 text-gray-100" # Golden yellow border, white text
    else
      options[:class] += " border-transparent text-gray-300 hover:border-amber-300 hover:text-gray-100"
    end
    
    link_to text, path, options
  end

  def mobile_nav_link_to(text, path, options = {})
    options[:class] ||= ""
    options[:class] += " block pl-3 pr-4 py-2 border-l-4 text-base font-medium"
    
    current_path = request.path
    is_current = current_path == path || (path != root_path && current_path.start_with?(path))
    
    if is_current
      options[:class] += " border-amber-300 bg-green-600 text-white"
    else
      options[:class] += " border-transparent text-gray-100 hover:bg-green-600 hover:border-amber-300 hover:text-white"
    end
    
    link_to text, path, options
  end

  def role_badge_color(role)
    case role
    when 'super_admin'
      'bg-purple-100 text-purple-800'
    when 'admin'
      'bg-blue-100 text-blue-800'
    when 'user'
      'bg-gray-100 text-gray-800'
    else
      'bg-gray-100 text-gray-800'
    end
  end

  def admin_user?
    user_signed_in? && (current_user.admin? || current_user.super_admin?)
  end

  def full_title(page_title = '')
    base_title = "Kilimarvelous Tour Company"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end