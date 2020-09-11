class NetworkMod < StatusMod
  def render
    # TODO: Make this a proper, Ruby-calling interface, rather than falling back to shell
    route = `ip route get 1.1.1.1`
    ip = route[/src .+/][/\d+\.\d+\.\d+\.\d+/]
    dev = route[/dev \w+/].split(" ")[1]
    return "⇆ #{ip} - #{dev}"
  end
end
