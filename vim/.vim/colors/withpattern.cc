#include <iostream>
#include <iomanip>
#include <cstdio>
#include <string>
#include <vector>

struct color_pattern_s
{
  std::string fg;
  std::string bg;
};

struct style_pattern_s
{
  std::vector<std::string> styles;
};

struct pattern_s
{
  color_pattern_s color;
  style_pattern_s style;
};

struct link_s
{
  std::string to;
};

struct hl_pattern_s
{
  pattern_s   gui;
  pattern_s   cterm;
  pattern_s   term;
};

static inline
std::ostream &operator <<(std::ostream &os, const style_pattern_s &style)
{
  if (style.styles.empty())
    return os << "none";

  for (auto n = style.styles.size(); n--; )
    os << style.styles[n] << (n ? "," : "");

  return os;
}

struct hl_entry_s
{
  std::string  name;
  hl_pattern_s pattern;
  bool         cleared;
  link_s       link;
};

static inline
std::ostream &operator <<(std::ostream &os, const hl_entry_s &hl)
{
  auto print_color = [](std::ostream &os, const color_pattern_s &color, const char *name)
    -> std::ostream &
  {
    if (!color.fg.empty())
      os << name << "fg=" << color.fg;

    if (!color.fg.empty() && !color.bg.empty())
      os << '\t';

    if (!color.bg.empty())
      os << name << "bg=" << color.bg;

    return os;
  };

  if (hl.cleared)
    return os << "hi! clear " << hl.name;

  if (!hl.link.to.empty())
    return os << "hi! link " << hl.name << "\t" << hl.link.to;

  os << "hi! " << hl.name << "\t";
  print_color(os, hl.pattern.gui.color, "gui") << "\t";
  print_color(os, hl.pattern.cterm.color, "cterm") << "\t";

  return os << "gui=" << hl.pattern.gui.style
    << " cterm=" << hl.pattern.cterm.style
    << " term="  << hl.pattern.term.style;
}

void compose(const char *colonam,
  std::vector<hl_pattern_s> patterns,
  std::vector<std::vector<std::string>> groups)
{
  auto &os = std::cout;

  os << "hi clear"                        << std::endl
     << "set background=dark"             << std::endl
     << "let g:colors_name = " << colonam << std::endl
     << "set nocul"                       << std::endl << std::endl;

  for (size_t i = 0; i != patterns.size() && i != groups.size(); ++i) {
    auto &&group = groups[i];

    os << "\" {{{" << std::endl;
    for (auto &&key : group)
      os << hl_entry_s { key, patterns[i], {}, {} } << std::endl;
    os << "\" }}}" << std::endl << std::endl;
  }

  os << std::endl;
}

int main(int argc, char **argv)
{
  (void)argc;
  (void)argv;

  // test
  const char *t_fg = argc > 1 ? argv[1] : "green";
  const char *t_bg = argc > 2 ? argv[2] : "black";
  const char *g_fg = argc > 3 ? argv[3] : "green";
  const char *g_bg = argc > 4 ? argv[4] : "black";

  const std::vector<hl_pattern_s> patterns = {
    { { { g_fg, g_bg }, {} },
      { { t_fg, t_bg }, {} },
      { { t_fg, t_bg }, {} } },
    { { { g_bg, g_fg }, {} },
      { { t_bg, t_fg }, {} },
      { { t_bg, t_fg }, {} } },
    { { { g_fg, g_fg }, {} },
      { { t_fg, t_fg }, {} },
      { { t_fg, t_fg }, {} } },
    { { { g_fg, g_bg }, { { "underline" } } },
      { { t_fg, t_bg }, { { "underline" } } },
      { { t_fg, t_bg }, { { "underline" } } } }
  };
  const std::vector<std::vector<std::string>> groups = {
    { "Normal", "Identifier", "LineNr", "MoreMsg", "ModeMsg",
      "Operator", "PreProc", "StatusLine", "PMenuSBar",
      "Constant", "TablineFill", "Tabline", "Number", "String",
      "Boolean", "Character", "Float", "NonText",
      "Directory", "NERDTreePartFile", "NERDTreePart", "CursorLineNr" },
    { "Todo", "PMenuThumb", "TabLineSel", "Visual", "ColorColumn",
      "Search", "PMenu", "SpecialKey", "Title", "Error", "Comment" },
    { "VertSplit" },
    { "Keyword", "Type", "Statement", "MatchParen", "PMenuSel", "WarningMsg",
      "Special", "Question", "IncSearch", "WildMenu", "Folded", "Underlined" }
  };

  compose("foo", patterns, groups);

  return 0;
}


