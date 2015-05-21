module HomeHelper
  def format_device(device)
    reg_exp = "([^@]+)"
    device.match(reg_exp)
  end
end
