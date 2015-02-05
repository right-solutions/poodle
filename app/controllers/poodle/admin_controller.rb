module Poodle
  class AdminController < ApplicationController

    helper Poodle::ApplicationHelper

    layout 'poodle/application'

    before_filter :require_admin, :set_navs, :parse_pagination_params
    before_filter :configure

    def index
      get_collections
    end

    def show
      obj = @options[:class].find(params[:id])
      instance_variable_set("@#{@options[:collection_name].to_s.singularize}", obj)
      render_list
    end

    def new
      obj = @options[:class].new
      instance_variable_set("@#{@options[:collection_name].to_s.singularize}", obj)
      render_list
    end

    def edit
      obj = @options[:class].find(params[:id])
      instance_variable_set("@#{@options[:collection_name].to_s.singularize}", obj)
      render_list
    end

    def create
      obj = @options[:class].new
      obj.assign_attributes(permitted_params)
      instance_variable_set("@#{@options[:collection_name].to_s.singularize}", obj)
      save_resource(obj)
    end

    def update
      obj = @options[:class].find(params[:id])
      obj.assign_attributes(permitted_params)
      instance_variable_set("@#{@options[:collection_name].to_s.singularize}", obj)
      save_resource(obj)
    end

    def destroy
      obj = @options[:class].find(params[:id])
      obj.destroy
      get_collections
      set_flash_message(@options[:messages][:delete], :success)
      respond_to do |format|
        format.js { render :index }
      end
    end

    private

    def set_navs
      set_nav(params[:controller])
    end

    def permitted_params
      raise "method 'permitted_params' not defined"
    end

    def default_collection_name
       params[:controller].gsub("admin/", "").to_s
    end

    def default_item_name
      default_collection_name.singularize.gsub("_", " ").titleize
    end

    def default_class
      default_collection_name.singularize.camelize.constantize
    end

    def default_configuration
      {
        collection_name: default_collection_name,
        item_name: default_item_name,
        class: default_class,
        messages: {
          add: I18n.translate("forms.add", item: default_item_name),
          create: I18n.translate("forms.create", item: default_item_name),
          update: I18n.translate("forms.update", item: default_item_name),
          save: I18n.translate("forms.save", item: default_item_name),
          remove: I18n.translate("forms.remove", item: default_item_name),
          delete: I18n.translate("forms.delete",item:  default_item_name)
        }
      }
    end

    def configure
      if defined?(@options)
        @options.reverse_merge!(default_configuration)
      else
        @options = default_configuration
      end
    end

    def prepare_query
      @relation = @options[:class].where("")
      if params[:query]
        @query = params[:query].strip
        @relation = @relation.search(@query) if !@query.blank?
      end
    end

    def get_collections
      prepare_query
      objects = @relation.order("created_at desc").page(@current_page).per(@per_page)
      instance_variable_set("@#{@options[:collection_name]}", objects)
      unless instance_variable_get("@#{@options[:collection_name].to_s.singularize}")
        instance_variable_set("@#{@options[:collection_name].to_s.singularize}", objects.first)
      end
      return true
    end

    def save_resource(obj)
      obj.save
      set_flash_message(@options[:messages][:save], :success) if obj.errors.blank?
      action_name = params[:action].to_s == "create" ? "new" : "edit"
      url = obj.persisted? ? url_for([:admin, obj]) : nil
      render_or_redirect(obj.errors.any?, url, action_name)
    end

    def render_or_redirect(error, redirect_url, action)
      respond_to do |format|
        format.html {
          if error
            render action: action
          else
            redirect_to redirect_url, notice: @options[:message]
          end
        }
        format.js {}
      end
    end

    def render_list
      respond_to do |format|
        format.html { get_collections and render :index }
        format.js {}
      end
    end

  end
end
