d3 = require('d3')

# stream_layers.js
# Inspired by Lee Byron's test data generator.
stream_layers = (n, m, o) ->
  if (arguments.length < 3)
    o = 0

  bump = (a) ->
    x = 1 / (.1 + Math.random())
    y = 2 * Math.random() - .5
    z = 10 / (.1 + Math.random())
    for i in [0..m]
      w = (i / m - y) * z
      a[i] += x * Math.exp(-w * w)

  d3.range(n).map(->
    a = []
    for i in [0..m]
      a[i] = o + o * Math.random()
    for i in [0..5]
      bump(a)
    a.map(stream_index)
  )

# Another layer generator using gamma distributions.
stream_waves = (n, m) ->
  d3.range(n).map((i) ->
    d3.range(m).map((j) ->
      x = 20 * j / m - i / 3
      2 * x * Math.exp(-.5 * x)
    ).map(stream_index)
  )

stream_index = (d, i) ->
  {x: i, y: Math.max(0, d)}

# stack.js
n = 4 # number of layers
m = 64 # number of samples per layer
data = d3.layout.stack()(stream_layers(n, m, .1))
color = d3.interpolateRgb("#aad", "#556")

p = 20
w = 960
h = 500 - .5 - p
mx = m
my = d3.max(data, (d) ->
  d3.max(d, (d) -> d.y0 + d.y)
)
mz = d3.max(data, (d) -> 
  d3.max(d, (d) -> d.y)
)
x = (d) -> d.x * w / mx
y0 = (d) -> h - d.y0 * h / my
y1 = (d) -> h - (d.y + d.y0) * h / my
y2 = (d) -> d.y * h / mz # or `my` to not rescale

render_chart = (selector) ->
  vis = d3.select(selector)
    .append("svg")
      .attr("width", w)
      .attr("height", h + p)

  layers = vis.selectAll("g.layer")
      .data(data)
    .enter().append("g")
      .style("fill", (d, i) -> color(i / (n - 1)) )
      .attr("class", "layer")

  bars = layers.selectAll("g.bar")
      .data((d) -> d )
    .enter().append("g")
      .attr("class", "bar")
      .attr("transform", (d) -> "translate(" + x(d) + ",0)" )

  bars.append("rect")
      .attr("width", x({x: .9}))
      .attr("x", 0)
      .attr("y", h)
      .attr("height", 0)
    .transition()
      .delay((d, i) -> i * 10 )
      .attr("y", y1)
      .attr("height", (d) -> y0(d) - y1(d) );

  labels = vis.selectAll("text.label")
      .data(data[0])
    .enter().append("text")
      .attr("class", "label")
      .attr("x", x)
      .attr("y", h + 6)
      .attr("dx", x({x: .45}))
      .attr("dy", ".71em")
      .attr("text-anchor", "middle")
      .text((d, i) -> i )

  vis.append("line")
      .attr("x1", 0)
      .attr("x2", w - x({x: .1}))
      .attr("y1", h)
      .attr("y2", h)

transitionGroup = () ->
  group = d3.selectAll("#chart")

  group.select("#group")
      .attr("class", "first active")

  group.select("#stack")
      .attr("class", "last")

  group.selectAll("g.layer rect")
    .transition()
      .duration(500)
      .delay((d, i) -> (i % m) * 10 )
      .attr("x", (d, i) -> x({x: .9 * ~~(i / m) / n}) )
      .attr("width", x({x: .9 / n}))
      .each("end", transitionEnd)

  transitionEnd = () ->
    d3.select(this)
      .transition()
        .duration(500)
        .attr("y", (d) -> h - y2(d) )
        .attr("height", y2)

transitionStack = ->
  stack = d3.select("#chart")

  stack.select("#group")
      .attr("class", "first")

  stack.select("#stack")
      .attr("class", "last active")

  stack.selectAll("g.layer rect")
    .transition()
      .duration(500)
      .delay((d, i) -> (i % m) * 10 )
      .attr("y", y1)
      .attr("height", (d) -> y0(d) - y1(d) )
      .each("end", transitionEnd)

  transitionEnd = ->
    d3.select(this)
      .transition()
        .duration(500)
        .attr("x", 0)
        .attr("width", x({x: .9}))

server = require('http').createServer (request, response) ->
  response.writeHead 200, {'Content-Type': 'text/plain'}
  response.end 'Hello World'
server.listen 8124
console.log 'Server running at http://0.0.0.0:8124/'
