class Application
   
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match("/items/")
        sent_item = req.path.split("/items/").last
        the_item = @@items.find{|i| i.name == sent_item}
        if the_item
            resp.write the_item.price
        else
            resp.write("Item not found")
            resp.status=400
        end
      else
        resp.write("Route not found")
        resp.status=404
      end
   
      resp.finish
    end
  end