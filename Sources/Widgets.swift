protocol Contextable {
    func get_context() -> [String: String]
}

protocol Renderable {
    func render_html(_ context: [String: String]) -> String
    func render() -> String
}

struct Widget: Contextable, Renderable {
    let is_required: Bool
    let name: String
    let value: String

    init(is_required: Bool = false, name: String, value: String){
        self.is_required = is_required
        self.name = name
        self.value = value
    }

    func get_context() -> [String: String] {
        let context = ["name": self.name, "value": self.value]
        return context
    }

    func render_html(_ context: [String: String]) -> String {
        var html = "<input type='text' name='\(context["name"]!)' value='\(context["value"]!)'"
        if (is_required){
            html += " required"
        }
        html += " />"
        return html
    }

    func render() -> String {
        let context = self.get_context()
        let html = self.render_html(context)
        return html
    }
}

var widget = Widget(is_required: true, name: "name", value: "faizal")
print(widget.render())