# puts font_families.sort
@xxx_large_font_size = screen_size(22 * Pango::SCALE)
@xx_large_font_size = screen_size(16 * Pango::SCALE)
@x_large_font_size = screen_size(12 * Pango::SCALE)
@large_font_size = screen_size(6 * Pango::SCALE)
@normal_font_size = screen_size(4.5 * Pango::SCALE)
@small_font_size = screen_size(4 * Pango::SCALE)
@x_small_font_size = screen_size(3.5 * Pango::SCALE)
@xx_small_font_size = screen_size(3 * Pango::SCALE)

@font_family = find_font_family('Franklin Gothic Medium')
@monospace_font_family = 'Ricty Discord'
@title_font_family = find_font_family('Star Jedi Hollow')

@default_headline_line_color = '#ffff00'
@default_headline_line_width = 2
@default_headline_line_expand = false

@default_emphasis_color = "#ff0000"
@default_emphasis_level2_color = "#ffffff"

set_graffiti_color "#FF2B22"
set_graffiti_line_width 10

#@table_frame_color = "#ffffff"
#@table_fill_color = "#0f0428"
#@table_body_frame_color = "#ffffff"
#@table_body_fill_color = "#3f3468"
#@table_head_frame_color = "#ffffff"
#@table_head_fill_color = "#rf0428"

@preformatted_fill_color = '#000000'
# @preformatted_centering = true
@space = screen_y(1)

# @margin_left = 300

@image_slide_number_start_flag_color = "#53575a"
@image_slide_number_goal_flag_color = "#a81313"

#@slide_headline_hide = true

@slide_background_image = 'images/star-background.jpg'
include_theme("slide-background-image")

@title_slide_background_image = 'images/star-background.jpg'
include_theme("title-slide-background-image")

include_theme('default')

match(Slide, HeadLine) do |heads|
  #heads.prop_set("size", 0)
  heads.prop_set("weight", "normal")
  set_font_family(heads)
end
match(Slide) do |slides|
  slides.prop_set("foreground", "#ffff00")
end

match TitleSlide do |slides|
  slides.margin_left = @margin_right
  slides.prop_set("foreground", "#ffff00")
end
match TitleSlide, Title do |title|
  title.margin_top = -100
  title.prop_set "size", @xxx_large_font_size
  title.prop_set "font-family", @title_font_family
  title.prop_set "weight", "normal"
end
match TitleSlide, Subtitle do |subtitle|
  subtitle.margin_top = -270
  subtitle.prop_set "size", @xxx_large_font_size
  subtitle.prop_set "font-family", @title_font_family
end
match TitleSlide, Author do |authors|
  authors.margin_top = -35
end
match TitleSlide, ContentSource do |cs|
  cs.margin_top = 30
  cs.prop_set "size", @xx_small_font_size
  cs.prop_set "style", "normal"
end
match TitleSlide, Date do |date|
  date.prop_set "size", @xx_small_font_size
  date.prop_set "style", "normal"
end
match TitleSlide, Institution do |i|
  i.prop_set "size", @xx_small_font_size
  i.prop_set "style", "normal"
end

#@slide_logo_image = 'images/mark_g.png'
#include_theme('slide-logo')

@item_image_1 = 'images/r2d2_icon-icons.com_76952.png'
@item_image_2 = 'images/c3p0_icon-icons.com_76936.png'
@item_image_3 = 'images/ewok_icon-icons.com_76943.png'

include_theme("default-item-mark")

add_image_path("rabbit-images")

slide_body = [Slide, Body]
item_list_item = [ItemList, ItemListItem]

indent = 30

match(*(slide_body + (item_list_item * 1))) do |items|
  name = "item1"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image_1, name, indent: indent)
end

match(*(slide_body + (item_list_item * 2))) do |items|
  name = "item2"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image_2, name, indent: indent)
end

match(*(slide_body + (item_list_item * 3))) do |items|
  name = "item3"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image_3, name, indent: indent)
end

enum_list_item = [EnumList, EnumListItem]

match(*(slide_body + enum_list_item + item_list_item)) do |items|
  name = "enum-item1"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image_1, name, indent: indent)
end

match(*(slide_body + enum_list_item + (item_list_item * 2))) do |items|
  name = "enum-item2"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image_2, name, indent: indent)
end

# table
all_table = ["**", Table]
match(*(all_table + [TableBody, TableRow, TableCell])) do |cells|
  set_font_family(cells, @monospace_font_family)
end
match(*(all_table + [TableHead, TableRow, TableHeader])) do |headers|
  set_font_family(headers, @monospace_font_family)
end

match("**", Emphasis, Emphasis) do |texts|
  texts.prop_set("foreground", @default_emphasis_level2_color)
  texts.prop_set("weight", "normal")
end

# Chapter
match Slide do |slides|
  slides.each do |slide|
    if slide.match?(/chapter/)
      set_font_family slide, @title_font_family
      slide.prop_set "size", @xx_large_font_size
      slide.horizontal_centering = true
    end
  end
end

match("**", PreformattedBlock) do |blocks|
  blocks.prop_set("foreground", "#00FFAF")
end
