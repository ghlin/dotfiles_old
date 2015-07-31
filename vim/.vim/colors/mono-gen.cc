#include <cstdio>


constexpr static const auto MAX_COLOR_NAME_LEN = 12;
struct color_pattern_s
{
  char fg[MAX_COLOR_NAME_LEN + 1];
  char bg[MAX_COLOR_NAME_LEN + 1];
};

constexpr static const auto MAX_STYLES = 5; // underline reverse none italic
struct style_pattern_s
{
  char styles[MAX_STYLES][MAX_COLOR_NAME_LEN + 1];
};

struct pattern_s
{
  color_pattern_s color_pattern;
  style_pattern_s style_pattern;
};

constexpr static const auto MAX_KEY_NAME_LEN = 40u;
struct hl_item_t
{
  char name[MAX_KEY_NAME_LEN + 1];
  pattern_s gui;
  pattern_s term;
};


static inline void print_style(std::FILE *pf, const char *guiorterm, const style_pattern_s &sp)
{
  std::fprintf(pf, " %s=", guiorterm);
  unsigned n = 0;
  for (; sp.styles[n][0]; ++n);

  if (n == 0) {
    std::fprintf(pf, "none");
    return;
  }

  while (n--)
    std::fprintf(pf, "%s%s", sp.styles[n], n ? "," : "");
}

static inline void print_item(std::FILE *pf, const hl_item_t &hl)
{
  std::fprintf(pf, "hi! %-25s guifg=%-12s guibg=%-12s ctermfg=%-12s ctermbg=%-12s",
    hl.name,
    hl.gui.color_pattern.fg, hl.gui.color_pattern.bg,
    hl.term.color_pattern.fg, hl.term.color_pattern.bg);

  print_style(pf, "gui", hl.gui.style_pattern);
  print_style(pf, "term", hl.term.style_pattern);
  print_style(pf, "cterm", hl.term.style_pattern);

  std::fprintf(pf, "\n");
}


#include <cstring>

hl_item_t hl_item(const char *key, const pattern_s &gui, const pattern_s &term)
{
  hl_item_t item = { "", gui, term };
  std::strcpy(item.name, key);

  return item;
}


static inline color_pattern_s make_color_pattern(const char *fg, const char *bg)
{
  color_pattern_s ret;
  std::strcpy(ret.fg, fg);
  std::strcpy(ret.bg, bg);

  return ret;
}

void generate(std::FILE *dest, const char *fg, const char *bg, const char *colonam) // {{{
{
  const constexpr auto STYLE_NONE      = style_pattern_s { { "", "", "", "", "" } };
  const constexpr auto STYLE_UNDERLINE = style_pattern_s { { "underline", "", "", "", "" } };

  const auto NORMAL_COLOR    = make_color_pattern(fg, bg);
  const auto URGENT_COLOR    = make_color_pattern(bg, fg);
  const auto SPECIAL_COLOR   = make_color_pattern(fg, bg);
  const auto SEPBAR_COLOR    = make_color_pattern(fg, fg);

#define HI(x)         print_item(dest, x)

#define HI_NORMAL(x)  HI(hl_item(x, { NORMAL_COLOR, STYLE_NONE }, { NORMAL_COLOR, STYLE_NONE }))
#define HI_URGENT(x)  HI(hl_item(x, { URGENT_COLOR, STYLE_NONE }, { URGENT_COLOR, STYLE_NONE }))
#define HI_SEPBAR(x)  HI(hl_item(x, { SEPBAR_COLOR, STYLE_NONE }, { SEPBAR_COLOR, STYLE_NONE }))
#define HI_SPECIAL(x) HI(hl_item(x, { SPECIAL_COLOR, STYLE_UNDERLINE }, { SPECIAL_COLOR, STYLE_UNDERLINE }))

#define HI_GROUP(HI_FUNC, x)    do { for (auto &&i : x) HI_FUNC(i); } while (false)

#define HI_GROUP_NORMAL(x)      HI_GROUP(HI_NORMAL, x)
#define HI_GROUP_URGENT(x)      HI_GROUP(HI_URGENT, x)
#define HI_GROUP_SEPBAR(x)      HI_GROUP(HI_SEPBAR, x)
#define HI_GROUP_SPECIAL(x)     HI_GROUP(HI_SPECIAL, x)

  constexpr const char group_normal[][MAX_KEY_NAME_LEN + 1] =
  {
    "Normal", "Identifier", "LineNr", "MoreMsg", "ModeMsg", "Operator", "PreProc", "StatusLine", "PMenuSBar",
    "Constant", "TablineFill", "Tabline", "Number", "String", "Boolean", "Character", "Float", "NonText",
    "CursorLineNr","Directory", "NERDTreePartFile", "NERDTreePart"
  };

  constexpr const char group_urgent[][MAX_KEY_NAME_LEN + 1] =
  {
    "Todo", "PMenuThumb", "TabLineSel", "Visual", "ColorColumn", "Search", "PMenu", "SpecialKey", "Title", "Error",
    "Comment"
  };

  constexpr const char group_sepbar[][MAX_KEY_NAME_LEN + 1] =
  {
    "VertSplit",
  };

  constexpr const char group_special[][MAX_KEY_NAME_LEN + 1] =
  {
    "Keyword", "Type", "Statement", "MatchParen", "PMenuSel", "WarningMsg",
    "Special", "Question", "IncSearch", "WildMenu", "Folded", "Underlined"
  };

  std::fprintf(dest,
    R"(
hi clear
set background=dark
let g:colors_name = '%s'
set nocul

)", colonam);

  HI_GROUP_NORMAL(group_normal);
  HI_GROUP_URGENT(group_urgent);
  HI_GROUP_SEPBAR(group_sepbar);
  HI_GROUP_SPECIAL(group_special);

  std::fprintf(dest, "\n");
} // }}}


int main(int argc, char **argv)
{
  if (argc < 3) {
    std::fprintf(stderr, "usage : %s fg bg [OUTPUTFILE]\n", argv[0]);
    return 1;
  }

  const char *fg = argv[1];
  const char *bg = argv[2];
  char colonam[80];

  if (argv[3])
    std::strcpy(colonam, argv[3]);
  else
    std::sprintf(colonam, "mono-%s-%s.vim", fg, bg);

  if (auto dest = std::fopen(colonam, "w")) {
    generate(dest, fg, bg, colonam);
    std::fclose(dest);
  } else return 2;

  return 0;
}

