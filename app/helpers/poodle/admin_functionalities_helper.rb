module Poodle
  module AdminFunctionalitiesHelper
    def get_collections(collection_name, **options)
      options.reverse_merge!(
        kls: collection_name.to_s.camelize.singularize.camelize.constantize
      )
      relation = options[:kls].where("")
      @filters = {}

      if params[:query]
        @query = params[:query].strip
        relation = relation.search(@query) if !@query.blank?
      end
      objects = relation.order("created_at desc").page(@current_page).per(@per_page)
      instance_variable_set("@#{collection_name}", objects)
      unless instance_variable_get("@#{collection_name.to_s.singularize}")
        instance_variable_set("@#{collection_name.to_s.singularize}", objects.first)
      end

      return true
    end

    def render_list(collection_name, **options)
      respond_to do |format|
        format.html {
          get_collections(collection_name, **options) and render :index }
        format.js {}
      end
    end

    def render_or_redirect(error, redirect_url, action)
      respond_to do |format|
        format.html {
          if error
            render action: action
          else
            redirect_to redirect_url, notice: @message
          end
        }
        format.js {}
      end
    end
  end
end
