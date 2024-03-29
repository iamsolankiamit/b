module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
  def path_to(options={})
    if @extra_url_for_options
      options = case options
                when String
                  uri = Addressable::URI.new
                  uri.query_values = @extra_url_for_options
                  options + (options.index('?').nil? ? '?' : '&') + uri.query
                when Hash
                  options.reverse_merge(@extra_url_for_options)
                else
                  options
                end
    end
    super
  end

  def _back_url(options={})
    if @extra_url_for_options
    options = case options
              when String
                uri= Addressable::URI.new
                uri.query_values = @extra_url_for_options
                options + (options.index('?').nil? ? '?' : '&') + uri.query
              when Hash
                options.reverse_merge(@extra_url_for_options)
              else
                options
              end
    end
  end

  def url_for(options={})
    if @extra_url_for_options
      options = case options
                when String
                  uri = Addressable::URI.new
                  uri.query_values = @extra_url_for_options
                  options + (options.index('?').nil? ? '?' : '&') + uri.query
                when Hash
                  options.reverse_merge(@extra_url_for_options)
                else
                  options
                end
    end
    super
  end

  def link_to_remove_fields(name, f, options = {})
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", options)
  end

  def link_to_add_fields(name, f, association, options = {})
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{ association }") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end

    link_to_function(name, "add_fields(this, \"#{ association }\", \"#{ escape_javascript(fields) }\")", options)
  end

end
