class WallustBase:
    crust: str
    mantle: str
    base: str
    surface0: str
    surface1: str
    surface2: str
    text: str
    subtext1: str
    subtext0: str
    overlay2: str
    overlay1: str
    overlay0: str
    accent: str
    red: str
    green: str
    yellow: str



class WallustDark(WallustBase):
    crust      = "{{ background | darken(0.4) | strip }}"
    mantle     = "{{ background | darken(0.2) | strip }}"
    base       = "{{ background | strip }}"
    surface0   = "{{ background | lighten(0.2) | strip }}"
    surface1   = "{{ background | lighten(0.4) | strip }}"
    surface2   = "{{ background | lighten(0.55) | strip }}"

    text       = "{{ foreground | strip }}"
    subtext1   = "{{ foreground | darken(0.15) | strip }}"
    subtext0   = "{{ foreground | darken(0.3) | strip }}"
    overlay2   = "{{ foreground | darken(0.55) | strip }}"
    overlay1   = "{{ foreground | darken(0.75) | strip }}"
    overlay0   = "{{ foreground | darken(0.85) | strip }}"

    accent     = "{{ color10 | strip }}"
    accent1     = "{{ color12 | strip }}"

    red        = "fd5f51"
    green      = "38c76a"
    yellow     = "fdbe04"



class WallustLight(WallustBase):
    crust      = "{{ foreground | darken(0.4) | strip }}"
    mantle     = "{{ foreground | darken(0.2) | strip }}"
    base       = "{{ foreground | strip }}"
    surface0   = "{{ foreground | lighten(0.2) | strip }}"
    surface1   = "{{ foreground | lighten(0.4) | strip }}"
    surface2   = "{{ foreground | lighten(0.55) | strip }}"

    text       = "{{ background | strip }}"
    subtext1   = "{{ background | darken(0.15) | strip }}"
    subtext0   = "{{ background | darken(0.3) | strip }}"
    overlay2   = "{{ background | darken(0.55) | strip }}"
    overlay1   = "{{ background | darken(0.75) | strip }}"
    overlay0   = "{{ background | darken(0.85) | strip }}"

    accent     = "{{ color2 | strip }}"
    accent1     = "{{ color4 | strip }}"

    red        = "fd5f51"
    green      = "38c76a"
    yellow     = "fdbe04"
