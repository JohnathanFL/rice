class BatteryMod < StatusMod
  def render
    return `acpi -b | awk -F'[,:]' '{print $3}'`
      .strip
  end
end
