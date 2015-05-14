Rails.application.config.after_initialize do

  # check configuration
  if AppConfig.has_key?(:user_defined_in_basic)
    AppConfig[:user_defined_in_basic].each do |keys, fields|
      fields.each do |field|
        unless JSONModel(:user_defined).schema['properties'].include?(field)
          $stderr.puts "WARNING: user_defined_in_basic plugin configuration includes " +
                       "a field (#{fld}) in the list for #{k} which is not a user_defined field. " +
                       "That's ok, we're just concerned you might have intended to refer to an actual field."
        end
      end
    end
  else
    $stderr.puts "WARNING: user_defined_in_basic plugin is active but not configured. " +
      "That's ok, it just won't do anything."
  end

end
