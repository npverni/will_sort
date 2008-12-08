module WillSort

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    
    attr_accessor :use_default_sort_by, :use_default_sort_dir
    
    def will_sort(params,default='')
      if !default.blank?
        self.use_default_sort_by, self.use_default_sort_dir = default.split(" ")
      else
        self.use_default_sort_by = self.default_sort_by
        self.use_default_sort_dir = self.default_sort_dir
      end
      get_search_order(params,self.use_default_sort_by,self.use_default_sort_dir)    
    end

    def get_search_order(params,default_sort_by,default_dir)
      sort_by =  safe_sort_param_or_default(params[:sort_by],default_sort_by)
      dir =      safe_sort_dir_or_default(params[:dir],default_dir)
      order = "#{sort_by} #{dir}"      
      logger.warn('[WILL_SORT] sorting by: ' + order)
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