module Teacher::VisibilitiesHelper
  def visibility_for(group, subject)
    Visibility.find_by(group: group, subject: subject)
  end
end
