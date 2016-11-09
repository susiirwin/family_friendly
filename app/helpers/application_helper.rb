module ApplicationHelper
  def format_display_address(address)
    formatted = address.delete("[]").gsub(/,/,"\n").gsub(/\"/, "")
    formatted
  end
end
