module Helpers
    def getToken
        js_script = 'return window.localStorage.getItem("default_auth_token");'
        page.execute_script(js_script)
    end
end