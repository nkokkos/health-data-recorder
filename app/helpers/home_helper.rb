module HomeHelper
  #methods here should be available in views
  def format_device(device)
    reg_exp = "([^@]+)"
    device.match(reg_exp)
  end
end
