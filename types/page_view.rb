PageView = Struct.new(:page, :ip) do
  def initialize(page, ip)
    validate_page(page)
    validate_ip(ip)
    super(page, ip)
  end

  private

  def validate_page(page)
    unless page.is_a?(String) && !page.strip.empty?
      raise ArgumentError, "Invalid page: #{page.inspect}"
    end
  end

  def validate_ip(ip)
    ip_regex = /\A(?:\d{1,3}\.){3}\d{1,3}\z/
    unless ip =~ ip_regex
      raise ArgumentError, "Invalid IP address: #{ip.inspect}"
    end
  end
end
