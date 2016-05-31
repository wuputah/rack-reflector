require 'cgi'

class RackReflector

  def initialize
    @cyclotron = 1
  end

  def call(env)
    [200, {'Content-type' => 'text/html'}, body(env)]
  end

private

  def body(env)
    body = []
    body << "<table border='1' cellpadding='4' cellspacing='0'>\n"
    env.each do |k, v|
      body << "<tr style='background-color: #{cycle("#aaa", "#ccc")}'>"
      body << "<td>#{k}</td>"
      body << "<td>#{CGI.escapeHTML(v.to_s)}</td>"
      body << "</tr>\n"
    end
    body << "</table>"
    body
  end

  def cycle(zero, one)
    @cyclotron = 1 - @cyclotron
    @cyclotron == 0 ? zero : one
  end

end

run RackReflector.new
