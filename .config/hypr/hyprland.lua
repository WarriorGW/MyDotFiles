-- Monitor configuration
require("monitors")

-- Input configuration
require("input")

-- Autostart applications
require("autostart")

-- Keybinds configuration
require("keybinds")

-- Environment variables
hl.env("XDG_MENU_PREFIX", "arch-")
hl.env("XCURSOR_THEME", "BreezeX-RoséPine")
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "kde")


-- Look and feel
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,

    border_size = 2,

    resize_on_border = false,

    allow_tearing = false,

    layout = "dwindle",
  },

  decoration = {
    rounding = 10,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 0.95,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)"
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696
    }
  }
})

hl.config({
  dwindle = {
    force_split                  = 0,
    preserve_split               = true,
    smart_split                  = false,
    smart_resizing               = true,
    permanent_direction_override = false,
    special_scale_factor         = 1,
    split_width_multiplier       = 1.0,
    use_active_for_splits        = true,
    default_split_ratio          = 1.0,
    split_bias                   = 0,
    precise_mouse_move           = false,
  },
})
