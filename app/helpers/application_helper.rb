module ApplicationHelper
  def format_display_address(address)
    # require 'pry'; binding.pry
    formatted = address.delete("[]").gsub(/,/,"\n").gsub(/\"/, "")
    formatted
  end
end
