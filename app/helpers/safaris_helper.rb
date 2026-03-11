module SafarisHelper
  def status_badge_color(status)
    case status.to_s.downcase
    when 'active' then 'bg-green-100 text-green-800'
    when 'inactive' then 'bg-red-100 text-red-800'
    when 'seasonal' then 'bg-yellow-100 text-yellow-800'
    else 'bg-gray-100 text-gray-800'
    end
  end

  def difficulty_badge_color(difficulty)
    case difficulty.to_s.downcase
    when 'easy' then 'bg-green-100 text-green-800'
    when 'moderate' then 'bg-yellow-100 text-yellow-800'
    when 'challenging' then 'bg-red-100 text-red-800'
    else 'bg-gray-100 text-gray-800'
    end
  end

   def difficulty_text_color(difficulty)
    case difficulty.to_s.downcase
    when 'easy' then 'text-green-600'
    when 'moderate' then 'text-yellow-600'
    when 'challenging' then 'text-red-600'
    else 'text-gray-600'
    end
  end
end