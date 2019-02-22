module StructureHelper
  include Hashie
  def company_structure
    structure_response = []
    grouped_user_hash = User.all.group_by(&:manager_id)

    counter = 0
    grouped_user_hash.each do |manager, group|
      group.each do |user|
        if manager == 0
          structure_response = [
            "id": user.id,
            "name": user.first_name + " " + user.last_name,
            "title": user.title,
            "direct_reports": []
          ]
        else
          structure_response.extend(Hashie::Extensions::DeepLocate)
          push_to = structure_response.deep_locate -> (key, value, object) { key == :id && value == manager }
          push_to[0][:direct_reports] << {
            "id": user.id,
            "name": user.first_name + " " + user.last_name,
            "title": user.title,
            "direct_reports": []
          }
        end
      end
    end

    structure_response.as_json
  end

  def subsection_structure(user)
    subsection_response = []
    grouped_user_hash = User.all.group_by(&:manager_id)

    subsection_response = [
      "id": user.id,
      "name": user.first_name + " " + user.last_name,
      "title": user.title,
      "direct_reports": []
    ]

    if grouped_user_hash.key? user.id
      grouped_user_hash[user.id].each do |user|
        subsection_response[0][:direct_reports] << {
          "id": user.id,
          "name": user.first_name + " " + user.last_name,
          "title": user.title
        }
      end
    else
      subsection_response = "Requested employee is not a manager."
    end

    return subsection_response.as_json
  end
end