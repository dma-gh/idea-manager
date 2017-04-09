module ProjectsHelper
  def compare_id_obj_array(id_array, object_array)
    object_id_array = object_array.map do |obj|
      obj = obj.id.to_s
    end
    
    id_array.map! do |id|
      id.to_s
    end
    
    return object_id_array.uniq.sort == id_array.uniq.sort
  end
end
