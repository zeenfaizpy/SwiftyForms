/*
Resources:
==========
https://stackoverflow.com/questions/26804066/does-swift-have-class-level-static-variables
https://stackoverflow.com/questions/33996864/override-static-var-in-a-child-class-swift
*/

/*
TODO:
========
Move all html string concatenation to templates and use any 
template engine to render it. Eg: stencil
*/

class Widget {
    let name: String
    let value: String
    var attrs: [String: String]
    let is_required: Bool
    var type : String {
        return ""
    }

    init(name: String, value: String, attrs: [String: String], is_required: Bool = false){
        self.name = name
        self.value = value
        self.attrs = attrs
        self.is_required = is_required
    }

    func get_context() -> [String: String] {
        var context = ["name": self.name, "value": self.value]
        // TODO: Find the better way to merge two dicts
        for (key, value) in  self.attrs{
            context[key] = value
        }
        return context
    }

    func render_html(_ context: [String: String]) -> String {
        var html_str = "<input 'type'='\(self.type)' 'name'='\(self.name)' 'value'='\(self.value)' "
        for (key, value) in self.attrs{
             html_str += "'\(key)'='\(value)' "
        }
        if (is_required){
            html_str += " required"
        }
        html_str += " />"
        return html_str
    }

    func render() -> String {
        let context = self.get_context()
        let html = self.render_html(context)
        return html
    }
}

class TextInput: Widget {
    override var type : String {
        return "text"
    }
}

class NumberInput: Widget {
    override var type : String {
        return "number"
    }
}

class EmailInput: Widget {
    override var type : String {
        return "email"
    }
}

class URLInput: Widget {
    override var type : String {
        return "url"
    }
}

class HiddenInput: Widget {
    override var type : String {
        return "hidden"
    }
}

class PasswordInput: Widget {
    override var type : String {
        return "password"
    }
}

var number_input = NumberInput(name: "name", value: "faizal", attrs: ["data-key": "number", "class": "number_input"], is_required: true)
print(number_input.render())