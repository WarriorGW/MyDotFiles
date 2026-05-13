-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
-- hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
-- hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
-- hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
-- hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
-- hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.curve("linear", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })
hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.3, -0.3 }, { 0, 1 } } })

hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 6,
  bezier = "wind",
  style = "slide"
})
hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "linear" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "wind", style = "slide" })
hl.animation({
  leaf = "specialWorkspace",
  enabled = true,
  speed = 6,
  bezier = "winIn",
  style =
  "slidefadevert -50%"
})
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 4, bezier = "winOut", style = "slide" })
