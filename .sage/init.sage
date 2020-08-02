%colors linux

latex.blackboard_bold(true)

from sage.misc.viewer import viewer
viewer.pdf_viewer('bspc rule -a Atril-previewer state=floating -o ; atril --preview')
viewer.png_viewer('bspc rule -a Eom state=floating -o ; eom')
