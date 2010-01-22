module AuthlogicFacebookConnect
  module Helper
    def authlogic_facebook_login_button(options = {})
      # TODO: Make this with correct helpers instead of this ugly hack.
      
      options[:controller] ||= "user_session"
      options[:js] ||= :prototype
      
      case options[:js]
      when :prototype
        js_selector = "$('connect_to_facebook_form')"
      when :jquery
        js_selector = "jQuery('#connect_to_facebook_form')"
      end
      
      if options[:url]
        url = options[:url]
        options.delete(:url)
      else
        url = "/#{options[:controller]}"
        options.delete(:controller)
      end
      output = "<form id='connect_to_facebook_form' method='post' action='#{url}'>\n"
      output << token_tag
      output << "</form>\n"
      output << "<script type='text/javascript' charset='utf-8'>\n"
      output << " function connect_to_facebook() {\n"
      output << "   #{js_selector}.submit();\n"
      output << " }\n"
      output << "</script>\n"
      output << fb_login_button("connect_to_facebook()", options)
      output
    end
  end
end
