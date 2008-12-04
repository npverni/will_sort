module WillSort

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    
    def will_sort(params)
      get_search_order(params,self.default_sort_by,self.default_sort_dir)    
    end

    def get_search_conditions(params)
      conditions = {}
      self.searchable_fields.each do |p|
        if self.param_exists(params,p)
          conditions[p] = params[p]
        end
      end      
      conditions
    end

    def get_search_order(params,default_sort_by,default_dir)
      sort_by =  safe_sort_param_or_default(params[:sort_by],default_sort_by)
      dir =      safe_sort_dir_or_default(params[:dir],default_dir)
      order = "#{sort_by} #{dir}"      
      return order
    end

    def safe_sort_param_or_default(param,default)
      sortable_fields = self.sortable_fields
      if param.blank? 
        return default
      else  
        if sortable_fields.include?(param)
          return param
        else
          return default
        end
      end
    end

    def safe_sort_dir_or_default(param,default)
      sortable_dirs = ['asc','desc']       
      if param.blank? 
        return default
      else  
        if sortable_dirs.include?(param)
          return param
        else
          return default
        end
      end      
    end

    def param_exists(params,param)
      params[param] && !params[param].blank?
    end

  end
end

class ActiveRecord::Base
  include WillSort
end