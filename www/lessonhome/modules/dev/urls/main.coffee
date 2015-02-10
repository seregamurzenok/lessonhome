


class Viewer
  constructor : (@state,@parent)->
    @dom = $('<div class="viewer"><div class="left"><div class="in"></div><iframe></iframe></div><div class="right"><div class="in"></div><div class="img"><img /></div></div></div>')
    @frame = @dom.find 'iframe'
    @img   = @dom.find '.img'
    @rimg  = @img.find 'img'
    @rimg.attr 'src', @state.src
    @scroll = $(window).scrollTop()
    $('body').addClass 'g-fixed'
    @frame.attr 'src', @state.route
    @x = 0
    @y = 0
    @nx = 0
    @ny = 0
    @ix = 0
    @iy = 0
    @inx = 0
    @iny = 0
    @sc = 0.5
    @nsc = 0.6
    @onmm $(window).width()/2,80
    @x = @nx
    @y = @ny
    @ix = @inx
    @iy = @iny
    @timer()
    @dom.find('.in').click @parent.remove
  remove : =>
    $('body').removeClass 'g-fixed'
    $(window).scrollTop @scroll
    @dom.remove()
  mousemove : (e)=>
    x = e.clientX
    y = e.clientY
    @onmm x,y
  onmm : (x,y)=>
    fw = @frame.width()
    fh = @frame.height()
    Iw = @img.width()
    Ih = @img.height()
    fw = 1500 if fw < 100
    fh = 3000 if fh < 100
    Iw = 1500 if Iw < 100
    Ih = 3000 if Ih < 100
    ww = $(window).width()
    wh = $(window).height()
    w = fw*@sc+600
    h = fh*@sc
    iw = Iw*@sc+600
    ih = Ih*@sc
    W = ww
    H = wh
    
    dx = fw*(@sc-1)/2
    dy = fh*(@sc-1)/2
    idx = Iw*(@sc-1)/2
    idy = Ih*(@sc-1)/2

    cx = (x-W)/W+1
    cy = (y-(H))/(H)+1
    #h += 100
    #ih += 100
    @nx = (W/2-w)*cx+350
    @ny = (H/2-h)*cy+200
    @inx = (W/2-iw)*cx+350
    @iny = (H/2-ih)*cy+200
    #if @ny > 150
    #  @ny = 150
    #if @iny > 150
    #  @iny = 150
    @nx += dx
    @ny += dy
    @inx += idx
    @iny += idy
  mousewheel : (e)=>
    @nsc *= 1+0.1 * e.deltaY
    mx = 1.2
    c = @nsc/@sc
    if c > 1
      @nsc = @sc*mx
    if c < 1
      @nsc = @sc/mx
    
  timer : =>
    @x += (@nx-@x)/10
    @y += (@ny-@y)/10
    @ix += (@inx-@ix)/10
    @iy += (@iny-@iy)/10
    @sc += (@nsc-@sc)/10
    rheight = @rimg.height()
    rheight = 3000 if rheight < 100
    riw = @rimg.width()
    riw = 1500 if riw < 100
    @frame.css {
      transform : "translate(#{@x}px,#{@y}px) scale(#{@sc},#{@sc})"
      height : rheight
    }
    @img.css {
      transform : "translate(#{@ix}px,#{@iy}px) scale(#{@sc},#{@sc})"
      width : riw
    }


class @main
  show : =>
    @models = @dom.find 'a.model'
    @models.click @open
    @node = {}
    for name,state of @tree.states
      if state.model
        @node["#{state.model}"] = state
    $(window).mousemove (e)=> @viewer?.mousemove? e
    $(window).mousewheel (e)=> @viewer?.mousewheel? e
    $(window).keydown @remove
    setInterval @timer, 1000/60
    @setSort()
  remove : =>
    @viewer?.remove?()
    delete @viewer

  open : (e)=>
    e.preventDefault()
    @dom.find('.state.active').removeClass 'active'
    $(e.target).parent().addClass 'active'
    model = $(e.target).attr 'href'
    m =model.match /^\/file\/\w+\/models\/(.*)\.\w+$/
    console.log model
    return false unless m
    state = @node[m[1]]
    state.src = model
    return false unless state

    if @viewer?
      @viewer.remove()
      delete @viewer
    @viewer = new Viewer state,@
    @dom.append @viewer.dom
    return false
  timer : => @viewer?.timer?()
  setSort : =>
    divs = @dom.find '.state.top *'
    for d in divs
      d = $ d
      cl = d.attr 'class'
      do (d,cl)=>
        d.click =>
          @sort cl
    divs = @dom.find '.state'
    arr = []
    for d,i in divs
      continue unless i
      d = $ d
      o  = {
        dom : d
      }
      sub = d.find 'a'
      for s in sub
        s = $ s
        cl = s.attr 'class'
        text = s.html()
        o[cl] = text
      arr.push o
    @arr = arr
    @lastCl = "model"
    @setSorted @lastCl
  sort : (cl)=>
    cmp = (a,b)=> a>b
    if @lastCl == cl
      cmp = (a,b)=> a<b
      @lastCl = ""
    else
      @lastCl = cl
    for i in [0...@arr.length-1]
      for j in [i...@arr.length]
        if cmp @arr[i][cl],@arr[j][cl]
          k = @arr[i]
          @arr[i] = @arr[j]
          @arr[j] = k
          @place @arr,i
          @place @arr,j
    @setSorted cl
  setSorted : (cl)=>
    @dom.find('.top .sorted').removeClass 'sorted'
    @dom.find('.top .'+cl).addClass 'sorted'

  place : (arr,i)=>
    if i != 0
      arr[i].dom.insertAfter arr[i-1].dom
    else
      arr[i].dom.insertBefore arr[1].dom


